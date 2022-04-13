from . import views
from django.urls import path, include
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework import routers
from . views import *


# router = routers.DefaultRouter()
# router.register('balance', views.BalanceView, basename='balance')
# router.register('register', views.RegisterView, basename='register')
# router.register('transaction', views.TransactionView, basename='transaction')


urlpatterns = [
	# path('', include(router.urls)),
	path('index', views.index, name='index'),
	path('', views.welcome, name='welcome'),
	path('balance', views.BalanceView.as_view(), name='balance'),
	path('register', views.RegisterView.as_view(), name='register'),
	path('bankaccount', views.RegisterBankAccount.as_view(), name='bankaccount'),
	path('cash', views.CashDepositView.as_view(), name='cash'),
	path('cheque', views.ChequeDepositView.as_view(), name='cheque'),
	path('wallet_to_wallet', views.TransferDepositToOwnAccountView.as_view(), name='wallet_to_wallet'),
	path('pin', views.ConfirmPin.as_view(), name='pin'),
	path('withdraw', views.withdraw, name='withdraw'),
	path('nearestBanks', views.nearestBanks, name='nearestBanks'),
	path('banks', views.nearestBanksApi, name='banks'),
	# path('login', obtain_jwt_token, name='login'),
	path('login', views.LoginView.as_view(), name='login'),
	path('todaytransact', views.todayTransactions, name='todaytransact'),
	path('completetodaytransact/<int:obj_id>', views.completeTodayTransactions, name='completetodaytransact'),
]