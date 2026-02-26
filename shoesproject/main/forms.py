from django import forms
from main.models import Users, Products

class LoginForm(forms.Form):
    email = forms.EmailField(label='Почта')
    password = forms.CharField(
        label='Пароль',
        widget=forms.PasswordInput,
        )
    
    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get('email')
        password = cleaned_data.get('password')
        if email and password:
            try:
                user = Users.objects.get(email=email, password=password)
                cleaned_data['user'] = user
            except Users.DoesNotExist:
                raise forms.ValidationError('Неверная почта или пароль')
        return cleaned_data



class ProductForm(forms.ModelForm):
    class Meta:
        model = Products
        fields = [
            'article', 'product_type', 'unit', 'price', 
            'provider', 'manufacturer', 'category', 
            'current_discount', 'storage_count', 'description', 'img_path'
        ]
        labels = {
            'article': 'Артикул',
            'product_type': 'Тип товара',
            'unit': 'Единица измерения',
            'price': 'Цена',
            'provider': 'Поставщик',
            'manufacturer': 'Производитель',
            'category': 'Категория',
            'current_discount': 'Скидка (%)',
            'storage_count': 'Количество на складе',
            'description': 'Описание',
            'img_path': 'Изображение товара',
        }
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'price': forms.NumberInput(attrs={'step': '0.01'}),
            'current_discount': forms.NumberInput(attrs={'step': '0.01'}),
            'img_path': forms.FileInput(attrs={
                'accept': 'image/*',
                'class': 'form-control-file',
            }),
        }
    
    def clean_price(self):
        price = self.cleaned_data.get('price')
        if price < 0:
            raise forms.ValidationError('Цена не может быть отрицательной')
        return price
    
    def clean_storage_count(self):
        count = self.cleaned_data.get('storage_count')
        if count < 0:
            raise forms.ValidationError('Количество не может быть отрицательным')
        return count