from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, generics, viewsets
from .serializers import RegisterSerializer, UserSerializer, UserProfileSerializer, UserUpdateSerializer, CategorySerializer, MenuSerializer
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import permission_classes, api_view
from .models import UserProfile, User, Category, Menu
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.pagination import PageNumberPagination
from math import ceil

class MenuPagination(PageNumberPagination):
    page_size_query_param = 'page_size'

def home(request):
    raise Http404()

class RegisterView(APIView):
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response({'message': 'User registered successfully'}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class LoginView(ObtainAuthToken):
    def post(self, request):
        serializer = self.serializer_class(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)

        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)

        role = request.data.get('role')

        if user.role == role:
            user = UserSerializer(user).data
            return Response({'user': user, 'token': token.key})
        else:
            return Response({'message': 'Invalid role'}, status=status.HTTP_403_FORBIDDEN)

# @permission_classes([IsAuthenticated])
@api_view(['POST'])
def user_profile(request):
    user_id = request.data.get('user_id')
    try:
        profile = UserProfile.objects.get(user_id=user_id)
        serializer = UserProfileSerializer(profile, data=request.data, context={'request': request})
    except UserProfile.DoesNotExist:
        serializer = UserProfileSerializer(data=request.data, context={'request': request})

    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def get_user_profile(request, user_id):
    try:
        profile = UserProfile.objects.get(user_id=user_id)
        serializer = UserProfileSerializer(profile, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)
    except UserProfile.DoesNotExist:
        return Response({'message': 'User profile not found'}, status=status.HTTP_404_NOT_FOUND)
    
class UserUpdateAPIView(generics.UpdateAPIView):
    queryset = User.objects.all()
    serializer_class = UserUpdateSerializer

class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class MenuListCreateAPIView(generics.ListCreateAPIView):
    queryset = Menu.objects.all()
    serializer_class = MenuSerializer
    parser_classes = [MultiPartParser, FormParser]

    def perform_create(self, serializer):
        profile_images = self.request.FILES.getlist('profile_images')
        if profile_images:
            serializer.validated_data['profile_images'] = profile_images
        serializer.save()

class MenuUpdateAPIView(generics.UpdateAPIView):
    queryset = Menu.objects.all()
    serializer_class = MenuSerializer
    parser_classes = [MultiPartParser, FormParser]

    def perform_update(self, serializer):
        profile_images = self.request.FILES.getlist('profile_images')
        if profile_images:
            serializer.validated_data['profile_images'] = profile_images
        # else:
        #     del serializer.validated_data['profile_images']
        serializer.save()

class MenuRetrieveAPIView(generics.RetrieveAPIView):
    queryset = Menu.objects.all()
    serializer_class = MenuSerializer

# class MenuListAPIView(generics.ListAPIView):
#     queryset = Menu.objects.order_by('-id')
#     serializer_class = MenuSerializer
class MenuListAPIView(generics.ListAPIView):
    queryset = Menu.objects.order_by('-id')
    serializer_class = MenuSerializer
    pagination_class = PageNumberPagination
    pagination_class.page_size = 9
    
    def get_paginated_response(self, data):
        total_items = self.paginator.page.paginator.count
        page_size = self.pagination_class.page_size
        total_pages = ceil(total_items / page_size)
        page = self.paginate_queryset(self.queryset)
        current_page = self.paginator.page.number if page else None
        return Response({
            'total_pages': total_pages,
            'current_page': current_page,
            'count': self.paginator.page.paginator.count,
            'next': self.paginator.get_next_link(),
            'previous': self.paginator.get_previous_link(),
            'results': data
        })
    
class MenuDeleteAPIView(generics.DestroyAPIView):
    queryset = Menu.objects.all()
    serializer_class = MenuSerializer

