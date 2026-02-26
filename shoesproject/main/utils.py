import os
from django.conf import settings

def save_product_image(uploaded_file, product_id):
    extension = os.path.splitext(uploaded_file.name)[1].lower()
    if not extension:
        extension = '.png'
    
    new_filename = f"{product_id}{extension}"
    
    full_path = os.path.join(settings.MEDIA_ROOT, new_filename)

    with open(full_path, 'wb+') as destination:
        for chunk in uploaded_file.chunks():
            destination.write(chunk)
    
    return new_filename

def delete_product_image(image_path):
    if image_path:
        full_path = os.path.join(settings.MEDIA_ROOT, image_path)
        if os.path.exists(full_path):
            os.remove(full_path)