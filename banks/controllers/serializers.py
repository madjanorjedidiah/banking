from rest_framework import serializers
from banks.models import Transaction, Customer, CustomerWallet, CustomerAccount, Deposits, ChequeDeposits
from django.utils.translation import ugettext_lazy as _



class TransactSerializer(serializers.ModelSerializer):
	account_type = serializers.CharField(max_length=100)

	class Meta:
		model = Transaction
		fields = ( 'amount', 'purpose', 'account_type')


	def validate(self, validated_data):
		if validated_data['amount'] == '' or None:
			raise ValidationError('amount must not be empty')

		if validated_data['purpose'] == '' or None:
			raise ValidationError('purpose must not be empty')
		return validated_data


class AccountSerializer(serializers.ModelSerializer):

	class Meta:
		model = CustomerAccount
		fields = ('account_number', 'pin')

	def validate(self, validated_data):
		if validated_data['account_number'] is None:
			raise ValidationError('account_number must not be empty')

		if validated_data['pin'] is None:
			raise ValidationError('pin must not be empty')
		return validated_data


class PinSerializer(serializers.Serializer):
	pin = serializers.CharField(max_length=4)

	class Meta:
		model = CustomerAccount
		fields = ('pin')


class RegisterSerializer(serializers.ModelSerializer):

	class Meta:
		model = Customer
		fields = ('id', 'email', 'first_name', 'last_name', 'password')

	def validate(self, validated_data):
		if validated_data['email'] is None:
			raise ValidationError('email must not be empty')

		if validated_data['first_name'] is None:
			raise ValidationError('first_name must not be empty')

		if validated_data['last_name'] is None:
			raise ValidationError('last_name must not be empty')

		if validated_data['password'] is None:
			raise ValidationError('password must not be empty')
		return validated_data


class BalanceSerializer(serializers.ModelSerializer):
	# account_type = serializers.CharField(max_length=100)

	class Meta:
		model = CustomerWallet
		fields = ('id', 'account_type')



class LoginSerializers(serializers.ModelSerializer):
	email = serializers.CharField(max_length=255)
	password = serializers.CharField(
	    label=_("Password"),
	    style={'input_type': 'password'},
	    trim_whitespace=False,
	    max_length=128,
	    write_only=True
	)

	id = serializers.CharField(
	    label=_("id"),
	    trim_whitespace=False,
	    max_length=128,
	    read_only=True
	    )

	class Meta:
		model = Customer
		fields = ('id', 'email', 'password')

	def validate(self, validated_data):
		if validated_data['email'] is None:
			raise ValidationError('email must not be empty')

		if validated_data['password'] is None:
			raise ValidationError('password must not be empty')
		return validated_data


class nearestBankSerializer(serializers.Serializer):
	bank_name = serializers.CharField(max_length=100)
	lon = serializers.FloatField()
	lat = serializers.FloatField()

	def validate(self, validated_data):
		if validated_data['bank_name'] is None:
			raise ValidationError('bank_name must not be empty')
			
		if validated_data['lon'] is None:
			raise ValidationError('lon must not be empty')

		if validated_data['lat'] is None:
			raise ValidationError('lat must not be empty')
		return validated_data


class CashSerializer(serializers.ModelSerializer):
	#deposit_form = serializers.CharField(max_length=100)
	account_number = serializers.IntegerField()

	class Meta:
		model = Deposits
		fields = ( 'amount', 'account_number')

	def validate(self, validated_data):
		if validated_data['amount'] == '' or None:
			raise ValidationError('amount must not be empty')
		if validated_data['account_number'] == '' or None:
			raise ValidationError('account_number must not be empty')
		# if validated_data['deposit_form'] == '' or None:
		# 	raise ValidationError('deposit_form must not be empty')
		return validated_data


class TransferSerializer(serializers.ModelSerializer):
	#deposit_form = serializers.CharField(max_length=100)
	sender_account_number = serializers.IntegerField()
	reciever_account_number = serializers.IntegerField()

	class Meta:
		model = Deposits
		fields = ( 'amount', 'sender_account_number', 'reciever_account_number')

	def validate(self, validated_data):
		if validated_data['amount'] == '' or None:
			raise ValidationError('amount must not be empty')
		if validated_data['sender_account_number'] == '' or None:
			raise ValidationError('sender_account_number must not be empty')
		# if validated_data['deposit_form'] == '' or None:
		# 	raise ValidationError('deposit_form must not be empty')
		if validated_data['reciever_account_number'] == '' or None:
			raise ValidationError('reciever_account_number must not be empty')
		return validated_data


class ChequeSerializer(serializers.ModelSerializer):
	amount = serializers.IntegerField()
	account_number = serializers.IntegerField()

	class Meta:
		model = ChequeDeposits
		fields = ('bank_name', 'bank_branch', 'bank_account_number', 'account_number', 'amount')

	def validate(self, validated_data):
		if validated_data['bank_name'] == '' or None:
			raise ValidationError('bank_name must not be empty')
		if validated_data['bank_branch'] == '' or None:
			raise ValidationError('bank_branch must not be empty')
		if validated_data['bank_account_number'] == '' or None:
			raise ValidationError('bank_account_number must not be empty')
		if validated_data['account_number'] == '' or None:
			raise ValidationError('account_number must not be empty')
		if validated_data['amount'] == '' or None:
			raise ValidationError('amount must not be empty')
		return validated_data
