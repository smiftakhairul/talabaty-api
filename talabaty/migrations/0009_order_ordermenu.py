# Generated by Django 4.2.2 on 2023-06-19 16:58

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('talabaty', '0008_menu'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uid', models.CharField(max_length=255, unique=True)),
                ('amount', models.CharField(max_length=255)),
                ('net_amount', models.CharField(max_length=255)),
                ('status', models.CharField(default='pending', max_length=255)),
                ('location', models.CharField(max_length=255)),
                ('phone', models.CharField(max_length=255)),
                ('remarks', models.TextField(null=True)),
                ('estimated_time', models.CharField(max_length=255, null=True)),
                ('delivery_charge', models.CharField(max_length=255, null=True)),
                ('completed_at', models.CharField(max_length=255, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('customer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='customer_orders', to=settings.AUTH_USER_MODEL)),
                ('rider', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='rider_orders', to=settings.AUTH_USER_MODEL)),
                ('shop', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='shop_orders', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='OrderMenu',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('unit_price', models.CharField(max_length=255)),
                ('quantity', models.IntegerField()),
                ('total_price', models.CharField(max_length=255)),
                ('menu', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='talabaty.menu')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='talabaty.order')),
            ],
        ),
    ]
