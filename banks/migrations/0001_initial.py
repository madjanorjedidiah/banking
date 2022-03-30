# Generated by Django 3.0.7 on 2022-03-15 22:46

from django.conf import settings
import django.contrib.gis.db.models.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('first_name', models.CharField(blank=True, max_length=50)),
                ('last_name', models.CharField(blank=True, max_length=50)),
                ('is_active', models.BooleanField(default=True)),
                ('date_joined', models.DateTimeField(auto_now_add=True)),
                ('password', models.CharField(max_length=250)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Bnks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('geom', django.contrib.gis.db.models.fields.PointField(blank=True, null=True, srid=4326)),
                ('email_1', models.CharField(blank=True, max_length=254, null=True)),
                ('website_1', models.CharField(blank=True, max_length=254, null=True)),
                ('bank_nam_1', models.CharField(blank=True, max_length=254, null=True)),
                ('bank_typ_1', models.CharField(blank=True, max_length=254, null=True)),
                ('branch_1', models.CharField(blank=True, max_length=254, null=True)),
                ('atm_1', models.CharField(blank=True, max_length=254, null=True)),
                # ('interest_1', models.DecimalField(blank=True, decimal_places=65535, max_digits=65535, null=True)),
                ('interest_1', models.DecimalField(blank=True, decimal_places=4, max_digits=999, null=True)),                
                ('address_1', models.CharField(blank=True, max_length=254, null=True)),
                ('telephon_1', models.CharField(blank=True, max_length=254, null=True)),
                ('fax_1', models.CharField(blank=True, max_length=254, null=True)),
                ('weekend_1', models.CharField(blank=True, db_column='weekend__1', max_length=254, null=True)),
                # ('base_rat_1', models.DecimalField(blank=True, decimal_places=65535, max_digits=65535, null=True)),
                ('base_rat_1', models.DecimalField(blank=True, decimal_places=4, max_digits=999, null=True)),
                ('money_tr_1', models.CharField(blank=True, max_length=254, null=True)),
                ('atm_type_1', models.CharField(blank=True, max_length=254, null=True)),
                ('mobile_m_1', models.CharField(blank=True, max_length=254, null=True)),
                ('latitude', models.FloatField(blank=True, null=True)),
                ('longitude', models.FloatField(blank=True, null=True)),
            ],
            options={
                'db_table': 'bnks',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='CustomerWallet',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('account_type', models.CharField(blank=True, max_length=100)),
                ('bank_branch', models.CharField(blank=True, max_length=100)),
                ('account_balance', models.DecimalField(decimal_places=2, default=0.0, max_digits=12)),
                ('customer_fk', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'customer_wallet',
                'managed': (True,),
            },
        ),
        migrations.CreateModel(
            name='history',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('purpose', models.CharField(blank=True, choices=[('withdraw', 'withdraw'), ('deposit', 'deposit')], max_length=20, null=True)),
                ('amount', models.DecimalField(decimal_places=2, default=0.0, max_digits=12)),
                ('success', models.BooleanField(default=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('processed', models.BooleanField(default=False)),
                ('processed_date', models.DateTimeField()),
                ('customer_fk', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('customer_wallet_fk', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='banks.CustomerWallet')),
            ],
        ),
    ]
