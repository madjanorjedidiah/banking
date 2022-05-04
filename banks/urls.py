from . import views
from django.urls import path, include
from rest_framework_jwt.views import obtain_jwt_token
from . views import *


urlpatterns = [
	path('index', views.index, name='index'),
	path('', views.welcome, name='welcome'),
	path('balance', views.BalanceView.as_view(), name='balance'),
	path('register', views.RegisterView.as_view(), name='register'),
	path('bankaccount', views.RegisterBankAccount.as_view(), name='bankaccount'),
	path('cash', views.CashDepositView.as_view(), name='cash'),
	path('cheque', views.ChequeDepositView.as_view(), name='cheque'),
	path('wallet_to_wallet', views.TransferDepositToOwnAccountView.as_view(), name='wallet_to_wallet'),
	path('pin', views.ConfirmPin.as_view(), name='pin'),
	path('nearestBanks', views.nearestBanks, name='nearestBanks'),
	path('bankdetail', views.GetAccountDetails.as_view(), name='bankdetail'),
	path('withdraw', views.WithdrawCash.as_view(), name='withdraw'),
	path('banks', views.nearestBanksApi, name='banks'),
	path('login', views.LoginView.as_view(), name='login'),
	path('todaytransact', views.todayTransactions, name='todaytransact'),
	path('completetodaytransact/<int:obj_id>', views.completeTodayTransactions, name='completetodaytransact'),
]