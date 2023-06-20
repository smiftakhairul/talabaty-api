from rest_framework import serializers
from .models import User, UserProfile, Category, Menu, OrderMenu, Order
from urllib.parse import urljoin, quote
from django.conf import settings
from rest_framework.pagination import PageNumberPagination
from math import ceil

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        profile = UserProfile.objects.filter(user_id=instance.id).first()
        if profile:
            profile_serializer = UserProfileSerializer(profile, context=self.context)
            representation['profile'] = profile_serializer.data
        else:
            representation['profile'] = None
        return representation

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
            base_url = settings.DEFAULT_DOMAIN
            media_url = urljoin(base_url, settings.MEDIA_URL)
            return urljoin(media_url, quote(obj.profile_image.url))
        return None
    
    def get_banner_image(self, obj):
        request = self.context.get('request')
        if obj.banner_image:
            base_url = settings.DEFAULT_DOMAIN
            media_url = urljoin(base_url, settings.MEDIA_URL)
            return urljoin(media_url, quote(obj.banner_image.url))
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
    
class ShopSerializer(serializers.ModelSerializer):
    menus = MenuSerializer(many=True, read_only=True)
    
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role', 'menus']
        
class OrderMenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderMenu
        fields = '__all__'
    
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['menu'] = MenuSerializer(instance.menu, context=self.context).data
        return representation

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['shop'] = UserSerializer(instance.shop).data
        representation['customer'] = UserSerializer(instance.customer).data
        representation['rider'] = UserSerializer(instance.rider).data
        
        order_menus = OrderMenu.objects.filter(order=instance)
        order_menu_serializer = OrderMenuSerializer(order_menus, many=True, context=self.context)
        representation['order_menus'] = order_menu_serializer.data
        
        return representation

class OrderUpdateSerializer(serializers.ModelSerializer):
    uid = serializers.CharField(required=False)
    amount = serializers.CharField(required=False)
    net_amount = serializers.CharField(required=False)
    location = serializers.CharField(required=False)
    phone = serializers.CharField(required=False)
    
    class Meta:
        model = Order
        fields = '__all__'

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['shop'] = UserSerializer(instance.shop).data
        representation['customer'] = UserSerializer(instance.customer).data
        representation['rider'] = UserSerializer(instance.rider).data
        
        order_menus = OrderMenu.objects.filter(order=instance)
        order_menu_serializer = OrderMenuSerializer(order_menus, many=True, context=self.context)
        representation['order_menus'] = order_menu_serializer.data
        
        return representation

class UserOrderSerializer(serializers.ModelSerializer):
    orders = serializers.SerializerMethodField()
    
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role', 'orders']

    def get_orders(self, obj):
        orders = Order.objects.filter(customer=obj).order_by('-id')
        order_serializer = OrderSerializer(orders, many=True, context=self.context)
        return order_serializer.data


class UserPaginatedOrderSerializer(serializers.ModelSerializer):
    orders = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role', 'orders']

    def get_orders(self, obj):
        orders = Order.objects.filter(customer=obj).order_by('-id')

        paginator = PageNumberPagination()
        paginator.page_size = 5  # Set the desired page size
        paginated_orders = paginator.paginate_queryset(orders, self.context['request'])
        order_serializer = OrderSerializer(paginated_orders, many=True, context=self.context)
        total_items = paginator.page.paginator.count
        page_size = paginator.page_size
        total_pages = ceil(total_items / page_size)
        current_page = paginator.page.number if paginator.page else None
        
        return {
            'total_pages': total_pages,
            'current_page': current_page,
            'count': total_items,
            'next': paginator.get_next_link(),
            'previous': paginator.get_previous_link(),
            'results': order_serializer.data
        }

class ShopOrderSerializer(serializers.ModelSerializer):
    orders = serializers.SerializerMethodField()
    
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role', 'orders']

    def get_orders(self, obj):
        orders = Order.objects.filter(shop=obj).order_by('-id')
        order_serializer = OrderSerializer(orders, many=True, context=self.context)
        return order_serializer.data


class ShopPaginatedOrderSerializer(serializers.ModelSerializer):
    orders = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'phone', 'first_name', 'role', 'orders']

    def get_orders(self, obj):
        orders = Order.objects.filter(shop=obj).order_by('-id')

        paginator = PageNumberPagination()
        paginator.page_size = 5  # Set the desired page size
        paginated_orders = paginator.paginate_queryset(orders, self.context['request'])
        order_serializer = OrderSerializer(paginated_orders, many=True, context=self.context)
        total_items = paginator.page.paginator.count
        page_size = paginator.page_size
        total_pages = ceil(total_items / page_size)
        current_page = paginator.page.number if paginator.page else None
        
        return {
            'total_pages': total_pages,
            'current_page': current_page,
            'count': total_items,
            'next': paginator.get_next_link(),
            'previous': paginator.get_previous_link(),
            'results': order_serializer.data
        }

