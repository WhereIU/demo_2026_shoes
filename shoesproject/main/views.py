from django.shortcuts import redirect, render, get_object_or_404
from django.urls import reverse
from django.db import models
from django.db.models import Q
from django.contrib import messages
from django.conf import settings
from main.utils import save_product_image, delete_product_image
from main.forms import LoginForm, ProductForm
from main.models import Products, Providers, Categories, Manufacturers, ProductTypes, Units, ProductsInOrders

def index_view(request):
    if request.session.get('user_id') or request.session.get('user_role') == 'Гость':
        return redirect(reverse('main_product_list'))
    return redirect(reverse('main_login'))

def login_view(request):
    if request.session.get('user_id') or request.session.get('user_role') == 'Гость':
        return redirect(reverse('main_product_list'))
    
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            user = form.cleaned_data['user']
            request.session['user_id'] = user.id
            request.session['user_role'] = user.role.name
            request.session['user_name'] = f"{user.surname} {user.firstname}"
            return redirect(reverse('main_product_list'))
        else:
            return render(request, 'login.html', {
                'form': form,
    })
    form = LoginForm()
    return render(request, 'login.html', {
        'form': form,
    })

def guest_login_view(request):
    request.session['user_role'] = 'Гость'
    return redirect(reverse('main_product_list'))

def logout_view(request):
    request.session.flush()
    return redirect(reverse('main_login'))

def product_list_view(request):
    if not (request.session.get('user_id') or request.session.get('user_role') == 'Гость'):
        return redirect(reverse('main_login'))

    search = request.GET.get('search', '')
    provider_id = request.GET.get('provider', '')
    sort = request.GET.get('sort', '')

    products = Products.objects.all()

    if search:
        products = products.filter(
            Q(article__icontains=search) |
            Q(description__icontains=search) |
            Q(manufacturer__name__icontains=search) |
            Q(provider__name__icontains=search)
        )

    if provider_id:
        products = products.filter(provider_id=provider_id)

    if sort == 'price_asc':
        products = products.order_by('price')
    elif sort == 'price_desc':
        products = products.order_by('-price')
    elif sort == 'name_asc':
        products = products.order_by('article')
    elif sort == 'name_desc':
        products = products.order_by('-article')
    elif sort == 'stock_asc':
        products = products.order_by('storage_count')
    elif sort == 'stock_desc':
        products = products.order_by('-storage_count')


    return render(request, 'products.html', {
        'products': products,
        'providers': Providers.objects.all(),
        'search': search,
        'selected_provider': provider_id,
        'selected_sort': sort,
        'is_admin': request.session.get('user_role') == 'Администратор',
        'is_manager': request.session.get('user_role') == 'Менеджер',
        'user_name': request.session.get('user_name', 'Гость'),
 
        })

def product_add_view(request):
    if request.session.get('user_role') != 'Администратор':
        return redirect(reverse('main_product_list'))
    
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            
            last_id = Products.objects.aggregate(models.Max('id'))['id__max'] or 0
            product.id = last_id + 1
            
            product.save()
            
            if 'img_path' in request.FILES:
                image_path = save_product_image(request.FILES['img_path'], product.id)
                product.img_path = image_path
                product.save()
            
            return redirect(reverse('main_product_list'))
    else:
        form = ProductForm()
    
    
    return render(request, 'product_form.html', {
        'form': form,
        'categories': Categories.objects.all(),
        'manufacturers': Manufacturers.objects.all(),
        'providers': Providers.objects.all(),
        'product_types': ProductTypes.objects.all(),
        'units': Units.objects.all(),
        'user_name': request.session.get('user_name'),
        'is_admin': True,
    })

def product_edit_view(request, product_id):
    if request.session.get('user_role') != 'Администратор':
        return redirect(reverse('main_product_list'))
    
    product = get_object_or_404(Products, id=product_id)
    old_image_path = product.img_path
    
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():

            product = form.save(commit=False)
            
            if 'img_path' in request.FILES:
                if old_image_path:
                    delete_product_image(old_image_path)
                
                image_path = save_product_image(request.FILES['img_path'], product.id)
                product.img_path = image_path
            
            product.save()
            return redirect(reverse('main_product_list'))
    else:
        form = ProductForm(instance=product)
    

    return render(request, 'product_form.html', {
        'form': form,
        'product': product,
        'categories': Categories.objects.all(),
        'manufacturers': Manufacturers.objects.all(),
        'providers': Providers.objects.all(),
        'product_types': ProductTypes.objects.all(),
        'units': Units.objects.all(),
        'user_role': request.session.get('user_role'),
        'user_name': request.session.get('user_name'),
        'is_admin': True,
        'edit_mode': True,
    })

def product_delete_view(request, product_id):
    if request.session.get('user_role') != 'Администратор':
        return redirect(reverse('main_product_list'))
    
    product = get_object_or_404(Products, id=product_id)
    
    in_orders = ProductsInOrders.objects.filter(product=product).exists()
    
    if request.method == 'POST':
        if in_orders:
            messages.error(request, 'Нельзя удалить товар, который присутствует в заказах')
        else:
            if product.img_path:
                delete_product_image(product.img_path)
            product.delete()
            messages.success(request, 'Товар успешно удален')
        return redirect(reverse('main_product_list'))


    return render(request, 'product_confirm_delete.html',  {
        'product': product,
        'in_orders': in_orders,
        'user_role': request.session.get('user_role'),
        'user_name': request.session.get('user_name'),
        'is_admin': True,
    })

