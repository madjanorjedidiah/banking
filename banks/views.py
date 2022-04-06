from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, render, redirect
from .models import *
from django.contrib.gis.measure import D
from django.contrib.gis.geos import GEOSGeometry
from .controllers.travelTime import *
import requests
from rest_framework.views import APIView
from rest_framework.response import Response
from .controllers.serializers import *
from datetime import datetime
from rest_framework.authentication import *
from rest_framework.permissions import (AllowAny, IsAuthenticated, IsAdminUser)
# from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from django.db import transaction
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from django.db.models import Count, F, Value
from rest_framework.decorators import api_view
import time, json

# key = AIzaSyDjuOl64GgCThf9Z_ZlmVrd6clvKzEBqkA
# e.g
# https://maps.googleapis.com/maps/api/directions/json?origin=5.547100000041011,-0.3396350003990784&destination=5.550968333641188,-0.3397800001640363&sensor=false&key=AIzaSyDjuOl64GgCThf9Z_ZlmVrd6clvKzEBqkA
"""
d = routes[0]['legs'][0]['distance']['text']
t = routes[0]['legs'][0]['duration']['text']
"""


def index(request):
	return render(request, 'banks/index.html')


def welcome(request):
	return render(request, 'banks/welcome.html')

def withdraw(request):
	return render(request, 'banks/withdraw.html')


def nearestBanks(request):
	context = {}
	arr = []
	lon = float(request.GET.get('lon'))
	lat = float(request.GET.get('lat'))

	""" Distances will be calculated from this point, which does not have to be projected,
	that is if srid=4326"""
	pnt = GEOSGeometry('POINT(%d %d)' %(lon, lat), srid=4326)
	# Find all banks within 10 km. Units assumes meters should oly numerics be used
	near = Bnks.objects.filter(geom__distance_lte=(pnt, D(km=150)))
	if near:
		for a in near[:2]:
			data = {}
			loc = "https://maps.googleapis.com/maps/api/directions/json?origin=5.547100000041011,-0.3396350003990784&destination=5.550968333641188,-0.3397800001640363&sensor=false&key=AIzaSyDjuOl64GgCThf9Z_ZlmVrd6clvKzEBqkA"
			response = requests.request("GET", loc, headers=headers, data=payload)
			d = response['routes'][0]['legs'][0]['distance']['text']
			t = response['routes'][0]['legs'][0]['duration']['text']
			data['distance'] = d
			data['time'] = t
			arr.append(data)
			print(response)
			print(d)

		context['arr'] = arr
		return render(request, 'banks/nearBanks.html', context)
	else:
		context['arr'] = 'No data'
		return render(request, 'banks/nearBanks.html', context)




# def nearestBanks(request):
# 	context = {}
# 	arr = []
# 	lon = float(request.GET.get('lon'))
# 	lat = float(request.GET.get('lat'))

# 	""" Distances will be calculated from this point, which does not have to be projected,
# 	that is if srid=4326"""
# 	pnt = GEOSGeometry('POINT(%d %d)' %(lon, lat), srid=4326)
# 	# Find all banks within 10 km. Units assumes meters should oly numerics be used
# 	near = Bnks.objects.filter(geom__distance_lte=(pnt, D(km=150)))
# 	for a in near:
# 		data = {}
# 		dt_in_km = pnt.distance(a.geom) * 100
# 		data['obj'] = a
# 		data['distance'] = dt_in_km
# 		arr.append(data)
# 		# print(dt_in_km)
# 	# print(len(near))
# 	context['arr'] = arr

# 	return render(request, 'banks/nearBanks.html', context)



@api_view(['POST'])
def nearestBanksApi(request):
	context = {}
	arr = []
	serializer = nearestBankSerializer(data=request.data)
	if serializer.is_valid(raise_exception=True):
		lon = float(request.data.get('lon'))
		lat = float(request.data.get('lat'))
		bank_name = request.data.get('bank_name')
		headers, payload={}, {}

		""" Distances will be calculated from this point, which does not have to be projected,
		that is if srid=4326"""
		pnt = GEOSGeometry('POINT(%d %d)' %(lon, lat), srid=4326)
		# Find all banks within 150 km. Units assumes meters should oly numerics be used
		near = Bnks.objects.filter(bank_nam_1__iexact=bank_name, geom__distance_lte=(pnt, D(km=150)))[:3]
		if near:
			for a in near:
				data = {}
				loc = f"https://maps.googleapis.com/maps/api/directions/json?origin={lat},{lon}&destination={a.geom.centroid.y},{a.geom.centroid.x}&sensor=false&key=AIzaSyDjuOl64GgCThf9Z_ZlmVrd6clvKzEBqkA"
				response = requests.request("GET", loc, headers=headers, data=payload)
				json_data = json.loads(response.text)
				data['distance'] = json_data['routes'][0]['legs'][0]['distance']['text']
				data['time'] = json_data['routes'][0]['legs'][0]['duration']['text']
				arr.append(data)
				time.sleep(1) 
				
			context['data'] = arr
			return Response(context, status=status.HTTP_200_OK)
		else:
			context['data'] = 'No data'
			return Response(context, status=status.HTTP_200_OK)


class RegisterView(APIView):
	serializer_class = RegisterSerializer
	permission_classes = (AllowAny,)
	# allowed_methods = ['post']

	
	def post(self, request):
		serializer = self.serializer_class(data=request.data)
		if serializer.is_valid(raise_exception=True):
			with transaction.atomic():
				password = serializer.validated_data.pop('password', None)
				user = Customer.objects.create(**serializer.validated_data)
				user.set_password(password)
				user.save()
				return Response(serializer.validated_data, status=status.HTTP_201_CREATED)
		return Response(status=status.HTTP_400_BAD_REQUEST)



class BalanceView(APIView):
	serializer_class = BalanceSerializer
	permission_classes = (IsAuthenticated,)
	authentication_classes = [TokenAuthentication,]

	def post(self, request):
		serializer = self.serializer_class(data=request.data)
		if serializer.is_valid(raise_exception=True):
			bal = CustomerWallet.objects.filter(
				customer_fk=self.request.user, 
				account_type=serializer.validated_data['account_type'])
			data = self.serializer_class(bal[0]).data
			data['balance'] = bal[0].account_balance
			if bal and bal[0].customer_fk == self.request.user: return Response(data, status=status.HTTP_200_OK)
			else: return Response(status=status.HTTP_400_BAD_REQUEST)
		return Response(status=status.HTTP_400_BAD_REQUEST)



class TransactionView(APIView):
	serializer_class = TransactSerializer
	permission_classes = (IsAuthenticated,)
	authentication_classes = [TokenAuthentication,]
	# queryset = history.objects.filter(customer_fk__email=self.request.user)

	def post(self, request):
		now = datetime.now()

		current_time = now.strftime("%H:%M:%S")
		# if current_time <= '15:30:00':

		serializer = self.serializer_class(data=request.data)
		if serializer.is_valid(raise_exception=True):
			
			if serializer.validated_data['purpose'] == 'deposit':
				with transaction.atomic():
					trans = CustomerWallet.objects.filter(
						customer_fk=self.request.user, 
						account_type=serializer.validated_data['account_type']
						)
					trans.update(account_balance=F('account_balance') + serializer.validated_data.get('amount', 0))
					# hist = history.objects.filter(customer_fk__email = self.request.user)
					if trans: 
						Transaction.objects.create(
							purpose=serializer.validated_data['purpose'],
							amount=serializer.validated_data['amount'],
							success=True,
							customer_wallet_fk_id=trans[0].id,
							customer_fk=self.request.user,
							)
						return Response({"message":"deposit done successfully"}, status=status.HTTP_200_OK)
					# else:
					# 	Transaction.objects.create(
					# 		purpose=serializer.validated_data['purpose'],
					# 		amount=serializer.validated_data['amount'],
					# 		success=False,
					# 		customer_wallet_fk_id=trans[0].id,
					# 		customer_fk=self.request.user,
					# 		)
					# 	return Response({"message":"deposit failed"}, status=status.HTTP_400_BAD_REQUEST)


			else:
				with transaction.atomic():
					chk = CustomerWallet.objects.filter(
						customer_fk=self.request.user, 
						account_type=serializer.validated_data['account_type']
						)
					if chk and chk[0].account_balance >= serializer.validated_data.get('amount', 0):
						withdraw = CustomerWallet.objects.filter(
							customer_fk=self.request.user, 
							account_type=serializer.validated_data['account_type']
							).update(account_balance=F('account_balance') - serializer.validated_data.get('amount', 0))
						
						if withdraw: 
							Transaction.objects.create(
								purpose=serializer.validated_data['purpose'],
								amount=serializer.validated_data['amount'],
								success=True,
								customer_wallet_fk_id=chk[0].id,
								customer_fk=self.request.user,
								)
							return Response({"message":"withdraw done successfully"}, status=status.HTTP_200_OK)
						# else:
						# 	Transaction.objects.create(
						# 		purpose=serializer.validated_data['purpose'],
						# 		amount=serializer.validated_data['amount'],
						# 		success=False,
						# 		customer_wallet_fk_id=trans[0].id,
						# 		customer_fk=self.request.user,
						# 		)
						# 	return Response({"message":"withdraw failed"}, status=status.HTTP_400_BAD_REQUEST)
					else:
						return Response({"message":"insufficient balance"}, status=status.HTTP_400_BAD_REQUEST)

		return Response(status=status.HTTP_400_BAD_REQUEST)
		# else:
		# 	return Response({"message":"closing time up"}, status=status.HTTP_400_BAD_REQUEST)


class LoginView(APIView):
	permission_classes = (AllowAny,)
	serializer_class = LoginSerializers

	def post(self, validated_data):
		serializer = self.serializer_class(data=validated_data.data)
		if serializer.is_valid(raise_exception=True):
			user = authenticate(username=validated_data.data['email'], password=validated_data.data['password'])
			if not user:
				return Response({"message":"invalid credentials."}, status=status.HTTP_401_UNATHORISED)
			else:
				# get or create token
				token, created = Token.objects.get_or_create(user=user)
				return Response({'user':serializer.data['email'], 'token': token.key})
		return Response(status=status.HTTP_400_BAD_REQUEST)


# def get_this_day(self):
#         start = now().date()
#         end = start + timedelta(days=1)
#         return self.get_query_set().filter(pub_date__range=(start, end))


def todayTransactions(request):
	today = datetime.now().date()
	cur = history.objects.filter(date_created=today, success=True, processed=False)
	return 'done'


def completeTodayTransactions(request, obj_id):
	today = datetime.now().date()
	cur = history.objects.filter(id=obj_id).update(processed=True, processed_date=datetime.now())
	return 'done'