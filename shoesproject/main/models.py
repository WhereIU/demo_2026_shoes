# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Categories(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'categories'


class Manufacturers(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'manufacturers'


class OrderStatuses(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'order_statuses'


class Orders(models.Model):
    id = models.IntegerField(primary_key=True)
    order_date = models.DateField()
    delivery_date = models.DateField()
    pickup_point = models.ForeignKey('PickupPoints', models.DO_NOTHING)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    delivery_code = models.IntegerField()
    status = models.ForeignKey(OrderStatuses, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'orders'


class PickupPoints(models.Model):
    id = models.IntegerField(primary_key=True)
    index = models.IntegerField()
    city = models.CharField(max_length=50)
    street = models.CharField(max_length=50)
    house = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'pickup_points'


class ProductTypes(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'product_types'


class Products(models.Model):
    id = models.IntegerField(primary_key=True)
    article = models.CharField(max_length=30)
    product_type = models.ForeignKey(ProductTypes, models.DO_NOTHING)
    unit = models.ForeignKey('Units', models.DO_NOTHING)
    price = models.DecimalField(max_digits=9, decimal_places=2)
    provider = models.ForeignKey('Providers', models.DO_NOTHING)
    manufacturer = models.ForeignKey(Manufacturers, models.DO_NOTHING)
    category = models.ForeignKey(Categories, models.DO_NOTHING)
    current_discount = models.DecimalField(max_digits=5, decimal_places=2)
    storage_count = models.IntegerField()
    description = models.TextField(blank=True, null=True)
    img_path = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'products'


class ProductsInOrders(models.Model):
    id = models.IntegerField(primary_key=True)
    order = models.ForeignKey(Orders, models.DO_NOTHING)
    product = models.ForeignKey(Products, models.DO_NOTHING)
    amount = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'products_in_orders'


class Providers(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'providers'


class Roles(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'roles'


class Units(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'units'


class Users(models.Model):
    id = models.IntegerField(primary_key=True)
    role = models.ForeignKey(Roles, models.DO_NOTHING)
    surname = models.CharField(max_length=50)
    firstname = models.CharField(max_length=50)
    patronymic = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    password = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'users'
