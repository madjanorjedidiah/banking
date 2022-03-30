from django.test import TestCase
from django.urls import reverse, resolve
from banks.views import *



class TestUrls(TestCase):

	def testBalance(self):
		loc = reverse('balance')
		self.assertEqual(resolve(loc).func.view_class, BalanceView)


	def testRegister(self):
		loc = (reverse('register'))
		self.assertEqual(resolve(loc).func.view_class, RegisterView)


	def testTransaction(self):
		loc = (reverse('transaction'))
		self.assertEqual(resolve(loc).func.view_class, TransactionView)


	def testTransaction(self):
		loc = (reverse('transaction'))
		self.assertEqual(resolve(loc).func.view_class, TransactionView)


	def testTodayTransactions(self):
		loc = reverse('todaytransact')
		self.assertEqual(resolve(loc).func, todayTransactions)


	def testCompleteTodayTransactions(self):
		loc = reverse('completetodaytransact', args=[1])
		self.assertEqual(resolve(loc).func, completeTodayTransactions)