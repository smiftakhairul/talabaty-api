from rest_framework import serializers
from .models import User, UserProfile, Category, Menu
from urllib.parse import urljoin, quote
from django.conf import settings

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role']

class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('username', 'password', 'email', 'phone', 'first_name', 'role')

    def create(self, validated_data):
        user = User.objects.create(
            username=validated_data['username'],
            email=validated_data['email'],
            phone=validated_data['phone'],
            first_name=validated_data['first_name'],
            # last_name=validated_data['last_name'],
            role=validated_data['role']
        )
        user.set_password(validated_data['password'])
        user.save()
        return user
    
class UserProfileSerializer(serializers.ModelSerializer):
    profile_image = serializers.SerializerMethodField()
    banner_image = serializers.SerializerMethodField()
    
    class Meta:
        model = UserProfile
        fields = ['id', 'user_id', 'profile_image', 'banner_image', 'location', 'description']
        
    def create(self, validated_data):
        profile_image = self.context['request'].data.get('profile_image')
        validated_data['profile_image'] = profile_image
        banner_image = self.context['request'].data.get('banner_image')
        validated_data['banner_image'] = banner_image
        return super().create(validated_data)

    def update(self, instance, validated_data):
        profile_image = self.context['request'].data.get('profile_image')
        banner_image = self.context['request'].data.get('banner_image')
        if profile_image is not None:
            validated_data['profile_image'] = profile_image
        if banner_image is not None:
            validated_data['banner_image'] = banner_image
        return super().update(instance, validated_data)

    def get_profile_image(self, obj):
        request = self.context.get('request')
        if obj.profile_image:
            return request.build_absolute_uri(obj.profile_image.url)
        return None
    
    def get_banner_image(self, obj):
        request = self.context.get('request')
        if obj.banner_image:
            return request.build_absolute_uri(obj.banner_image.url)
        return None

class UserUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'password', 'email', 'first_name', 'phone']
    
    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        if password:
            instance.set_password(password)
        return super().update(instance, validated_data)
        
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'slug', 'created_at', 'updated_at']

class MenuSerializer(serializers.ModelSerializer):
    profile_images = serializers.SerializerMethodField()

    class Meta:
        model = Menu
        fields = '__all__'

    def get_profile_images(self, obj):
        request = self.context.get('request')
        if obj.profile_images:
            base_url = request.build_absolute_uri('/')  # Get the base URL
            media_url = urljoin(base_url, settings.MEDIA_URL)  # Join base URL and media URL
            # return [urljoin(media_url, image) for image in obj.profile_images]
            return [urljoin(media_url, quote(image)) for image in obj.profile_images]
        return None
    
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['user'] = UserSerializer(instance.user).data
        representation['category'] = CategorySerializer(instance.category).data
        return representation

