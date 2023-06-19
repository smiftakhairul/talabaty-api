from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.files.storage import FileSystemStorage
from django.conf import settings

class User(AbstractUser):
    ROLE_CHOICES = (
        ('shop', 'Shop'),
        ('customer', 'Customer'),
        ('rider', 'Rider'),
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES)
    phone = models.CharField(max_length=255, null=True)

class UserProfile(models.Model):
    user_id = models.IntegerField()
    # profile_image = models.CharField(max_length=255, null=True)
    profile_image = models.ImageField(upload_to='profile_images/', null=True, max_length=255)
    banner_image = models.ImageField(upload_to='banner_images/', null=True, max_length=255)
    location = models.CharField(max_length=255, null=True)
    description = models.TextField()
    
class Category(models.Model):
    name = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Menu(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='menus')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='menus', null=True)
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    price = models.CharField(max_length=255)
    discount_price = models.CharField(max_length=255, blank=True, null=True, default='0')
    slug = models.CharField(max_length=255)
    uid = models.CharField(max_length=255, unique=True)
    profile_images = models.JSONField(blank=True, null=True)
    status = models.BooleanField(default=True)
    is_favorite = models.BooleanField(default=False)
    is_featured = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def save(self, *args, **kwargs):
        if self.profile_images:
            profile_images_paths = []
            storage = FileSystemStorage(location=settings.MEDIA_ROOT)
            
            for image in self.profile_images:
                saved_image_path = "/media/" + storage.save(image.name, image)
                profile_images_paths.append(saved_image_path)

            self.profile_images = profile_images_paths
        
        super().save(*args, **kwargs)
