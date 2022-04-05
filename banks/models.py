from __future__ import unicode_literals
from django.db import models
from django.contrib.gis.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin





class Bnks(models.Model):
    geom = models.PointField(blank=True, null=True)  # This field type is a guess.
    email_1 = models.CharField(max_length=254, blank=True, null=True)
    website_1 = models.CharField(max_length=254, blank=True, null=True)
    bank_nam_1 = models.CharField(max_length=254, blank=True, null=True)
    bank_typ_1 = models.CharField(max_length=254, blank=True, null=True)
    branch_1 = models.CharField(max_length=254, blank=True, null=True)
    atm_1 = models.CharField(max_length=254, blank=True, null=True)
    interest_1 = models.DecimalField(max_digits=999, decimal_places=4, blank=True, null=True)
    address_1 = models.CharField(max_length=254, blank=True, null=True)
    telephon_1 = models.CharField(max_length=254, blank=True, null=True)
    fax_1 = models.CharField(max_length=254, blank=True, null=True)
    weekend_1 = models.CharField(db_column='weekend__1', max_length=254, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    base_rat_1 = models.DecimalField(max_digits=999, decimal_places=4, blank=True, null=True)
    money_tr_1 = models.CharField(max_length=254, blank=True, null=True)
    atm_type_1 = models.CharField(max_length=254, blank=True, null=True)
    mobile_m_1 = models.CharField(max_length=254, blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    longitude = models.FloatField(blank=True, null=True)
    # objects = models.GeoManager()

    class Meta:
        managed = True
        db_table = 'bnks'


class UserManager(BaseUserManager):
    """
    Django requires that custom users define their own Manager class. By
    inheriting from `BaseUserManager`, we get a lot of the same code used by
    Django to create a `User`. 

    All we have to do is override the `create_user` function which we will use
    to create `User` objects.
    """

    def create_user(self, username, email, password=None):
        """Create and return a `User` with an email, username and password."""
        if username is None:
            raise TypeError('Users must have a username')

        if email is None:
            raise TypeError('Users must have an email account')

        user = self.model(username=username, email=self.normalize_email(email))
        user.set_password(password)
        user.save()
        return user


    def create_superuser(self, username, email, password):
        """
        Create and return a `User` with superuser (admin) permissions.
        """
        if password is None:
            raise TypeError('Superusers must have a password')

        spr = self.create_user(username, email, password)
        spr.is_active = True
        spr.is_superuser = True
        spr.is_staff = True
        spr.save()
        return spr


    # @property
    # def token(self):
    #     """
    #     Allows us to get a user's token by calling `user.token` instead of
    #     `user.generate_jwt_token().

    #     The `@property` decorator above makes this possible. `token` is called
    #     a "dynamic property".
    #     """
    #     return self._generate_jwt_token()


    # def _generate_jwt_token(self):
    #     """
    #     Generates a JSON Web Token that stores this user's ID and has an expiry
    #     date set to 60 days into the future.
    #     """
    #     dt = datetime.now() + timedelta(days=60)

    #     token = jwt.encode({
    #         'id': self.pk,
    #         'exp': int(dt.strftime('%s'))
    #     }, settings.SECRET_KEY, algorithm='HS256')

    #     return token.decode('utf-8')





class Customer(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=50, blank=True)
    last_name = models.CharField(max_length=50, blank=True)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    password = models.CharField(max_length=250)
    # account_number = models.CharField(max_length=15, blank=True, unique=True)

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def get_full_name(self):
        """ Returns full name of the user """
        return self.first_name + " " + self.last_name

    def __str__(self):
        return self.email


class CustomerWallet(models.Model):
    ACC = (
        ('savings','savings'),
        ('current','current'),
        ('cheque','cheque')
        )
        
    account_type = models.CharField(choices=ACC, max_length=100, blank=True)
    bank_branch = models.CharField(max_length=100, blank=True)
    account_balance = models.DecimalField(max_digits=12, decimal_places=2, default=0.0)
    customer_fk = models.ForeignKey(Customer, on_delete=models.CASCADE)

    class Meta:
        managed = True,
        db_table = 'customer_wallet'



class Transaction(models.Model):
    """ this is to track all transactions within the system """

    action = (
        ('withdraw', 'withdraw'),
        ('deposit', 'deposit')
    )

    purpose = models.CharField(choices=action, max_length=20, blank=True, null=True)
    amount = models.DecimalField(max_digits=12, decimal_places=2, default=0.0)
    success = models.BooleanField(default=True)
    date_created = models.DateTimeField(auto_now_add=True)
    processed = models.BooleanField(default=False)
    processed_date = models.DateTimeField(blank=True, null=True)
    customer_wallet_fk = models.ForeignKey(CustomerWallet, on_delete=models.CASCADE)
    customer_fk = models.ForeignKey(Customer, on_delete=models.CASCADE)
