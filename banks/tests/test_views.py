from django.test import TestCase
from banks.models import *
from django.urls import reverse
from rest_framework.test import APITestCase, APIClient
from rest_framework_jwt.settings import api_settings



class TestViews(APITestCase):

	def setUp(self):
		self.client = APIClient()
		self.reg_data = {
			"first_name": "Jed",
			"last_name": "Tetteh",
			"password" : "jed1234",
			"email": "jmadjanor6@gmail.com"
			}
		self.log_data = {
			"email": "jmadjanor6@gmail.com",
			"password" : "jed1234"
		}


	# def testRegister(self):
	# 	res = self.client.post(reverse('register'),	self.reg_data, format='json')
	# 	return self.assertEqual(res.status_code, 201)


	# def testBalance(self):
	# 	res = self.client.get(reverse('balance'))
	# 	return self.assertEqual(res.status_code, 200)


	# def testTransaction(self):
	# 	res = self.client.post(reverse('transaction'))
	# 	return self.assertEqual(res.status_code, 200)


	def testLogin(self):
		user = Customer.objects.create(**self.reg_data)
		user.is_active=True
		user.save()
		log = self.client.post(reverse('login'), self.log_data, format='json')
		print(log)
		# token = log.data['token']
		# print(token)
		self.client.credentials(HTTP_AUTHORIATION=f'Bearer {token}')
		return self.assertEqual(log.status_code, 200)



# class TestNoApi(TestCase):

# 	def testTodayTransact(self):
# 		res = reverse('todaytransact')
# 		return self.assertEqual(res, 'done')
