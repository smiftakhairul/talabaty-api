from django.contrib import admin
from django.urls import path
from django.conf import settings
from . import views
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name='home'),
    path('api/login', views.LoginView.as_view(), name='login'),
    path('api/register', views.RegisterView.as_view(), name='register'),
    path('api/update-user-profile', views.user_profile, name='update-user-profile'),
    path('api/user-profile/<int:user_id>/', views.get_user_profile, name='user-profile'),
    path('api/users/<int:pk>/', views.UserUpdateAPIView.as_view(), name='update-user'),
    path('api/categories', views.CategoryViewSet.as_view({'get': 'list'}), name='categories'),
    
    path('api/menus/', views.MenuListAPIView.as_view(), name='menus'),
    path('api/menus/<int:pk>/', views.MenuRetrieveAPIView.as_view(), name='menu-retrieve'),
    path('api/menus/create/', views.MenuListCreateAPIView.as_view(), name='menu-create'),
    path('api/menus/<int:pk>/update/', views.MenuUpdateAPIView.as_view(), name='menu-update'),
    path('api/menus/<int:pk>/delete/', views.MenuDeleteAPIView.as_view(), name='menu-delete'),
    
    path('api/shops/', views.ShopListAPIView.as_view(), name='shop-menu-list'),
    path('api/shops/<int:id>/', views.ShopDetailAPIView.as_view(), name='shop-detail'),
    
    path('api/orders/create/', views.OrderCreateAPIView.as_view(), name='order-create'),
    path('api/orders/<int:pk>/update/', views.OrderUpdateAPIView.as_view(), name='order-update'),
    
    path('api/user-orders/<int:id>/', views.UserOrderAPIView.as_view(), name='user-detail'),
    path('api/user-paginated-orders/<int:id>/', views.UserPaginatedOrderAPIView.as_view(), name='user-detail-paginated'),
    path('api/shop-orders/<int:id>/', views.ShopOrderAPIView.as_view(), name='shop-detail'),
    path('api/shop-paginated-orders/<int:id>/', views.ShopPaginatedOrderAPIView.as_view(), name='shop-detail-paginated'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.ADMIN_ENABLED:
    urlpatterns += [
        path('admin/', admin.site.urls),
    ]
