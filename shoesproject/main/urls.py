"""shoesproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index_view, name='main_index'),
    path('login/', views.login_view, name='main_login'),
    path('login/guest/', views.guest_login_view, name='main_guest_login'),
    path('logout/', views.logout_view, name='main_logout'),
    path('products/', views.product_list_view, name='main_product_list'),
    path('products/add/', views.product_add_view, name='main_product_add'),
    path('products/<int:product_id>/edit/', views.product_edit_view, name='main_product_edit'),
    path('products/<int:product_id>/delete/', views.product_delete_view, name='main_product_delete'),
]
