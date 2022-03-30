from rest_framework import serializers
from banks.models import history, Customer, CustomerWallet



class TransactSerializer(serializers.ModelSerializer):
	account_type = serializers.CharField(max_length=100)

	class Meta:
		model = history
		fields = ('id', 'amount', 'purpose', 'account_type', 'customer_fk', 'customer_wallet_fk')


	def validate(self, validated_data):
		if validated_data['amount'] == '' or None:
			raise ValidationError('amount must not be empty')

		if validated_data['purpose'] == '' or None:
			raise ValidationError('purpose must not be empty')

		if validated_data['customer_fk'] == '' or None:
			raise ValidationError('customer is not known')

		return validated_data



class RegisterSerializer(serializers.ModelSerializer):

	class Meta:
		model = Customer
		fields = ('id', 'email', 'first_name', 'last_name', 'password')

	def validate(self, validated_data):
		if validated_data['email'] is None:
			raise ValidationError('email must not be empty')

		if validated_data['first_name'] is None:
			raise ValidationError('email must not be empty')

		if validated_data['last_name'] is None:
			raise ValidationError('last_name must not be empty')

		if validated_data['password'] is None:
			raise ValidationError('password must not be empty')
		return validated_data


class BalanceSerializer(serializers.ModelSerializer):
	account_type = serializers.CharField(max_length=100)

	class Meta:
		model = CustomerWallet
		fields = ('id', 'account_type')



class LoginSerializers(serializers.ModelSerializer):

	class Meta:
		model = Customer
		fields = ('email', 'password')

	def validate(self, validated_data):
		if validated_data['email'] is None:
			raise ValidationError('email must not be empty')

		if validated_data['password'] is None:
			raise ValidationError('password must not be empty')
		return validated_data