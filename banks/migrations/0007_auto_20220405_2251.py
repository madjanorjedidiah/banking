# Generated by Django 3.0.7 on 2022-04-05 22:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('banks', '0006_auto_20220405_2223'),
    ]

    operations = [
        migrations.AlterField(
            model_name='transaction',
            name='processed_date',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
