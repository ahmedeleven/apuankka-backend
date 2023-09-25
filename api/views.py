from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.http import HttpResponse
from .models import UserProfile
from .models import Service
from .serializers import UserProfileSerializer
from .serializers import ServiceSerializer
from .serializers import UserSerializer
from django.utils import timezone

#import requests

# Create your views here.








@api_view(['POST'])
def register_user(request):
    username = request.data.get('username')
    password = request.data.get('password')
    email = request.data.get('email')

    if not username or not password:
        return Response({'error': 'Username and password are required.'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = User.objects.create_user(username=username, password=password, email=email)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

    token, _ = Token.objects.get_or_create(user=user)
    return Response({'token': token.key}, status=status.HTTP_201_CREATED)




@api_view(['POST'])
def login_user(request):
    username = request.data.get('username')
    password = request.data.get('password')

    user = authenticate(request, username=username, password=password)

    if user is not None:
        #login(request, user)
        token, _ = Token.objects.get_or_create(user=user)
        return Response({'token': token.key}, status=status.HTTP_200_OK)

    return Response({'error': 'Invalid credentials.'}, status=status.HTTP_401_UNAUTHORIZED)


# Function to test the api
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def test_function(request):
	return Response({'message': 'Hello!!'})


'''@api_view(['GET'])
@permission_classes([IsAuthenticated])
def protected_view(request):
    user = request.user
    return Response({'message': f'Hello, {user.username}! This is a protected view.'})'''


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_profile(request):
    user_profile = UserProfile.objects.get(user=request.user)
    serializer = UserProfileSerializer(user_profile)
    return Response(serializer.data)



@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_user_profile(request, username):
    try:
        user_profile = UserProfile.objects.get(user__username=username)
    except UserProfile.DoesNotExist:
        # If UserProfile doesn't exist, create it
        user_profile = UserProfile(user=request.user)

    # Check if the authenticated user is the same as the one being updated
    if request.user != user_profile.user:
        return Response({'error': 'Unauthorized'}, status=status.HTTP_401_UNAUTHORIZED)

    serializer = UserProfileSerializer(user_profile, data=request.data)
    
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'User profile updated successfully', 'user_id': serializer.data['user_id']})
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)





@api_view(['POST'])
@permission_classes([IsAuthenticated])
def add_service(request):
    data = request.data
    serializer = ServiceSerializer(data=data, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    else:
        return Response(serializer.errors)




@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_service(request, service_id):
    try:
        service = Service.objects.get(id = service_id)
        #return Response({'message': request.user.id})
    except Service.DoesNotExist:
        return Response({'error': 'Service does not exist'}, status=status.HTTP_404_NOT_FOUND)


    if request.user.id != service.user.id:
        return Response({'error': 'Unauthorized'}, status=status.HTTP_401_UNAUTHORIZED)
    else:
        data = request.data.copy()
        data['modified'] = timezone.now().date()
        serializer = ServiceSerializer(service, data=data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            #return Response({'message': 'Service updated successfully'})
            return Response({'message': serializer.data})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_services(request):
    status = request.query_params.get('status')
    if status:
        services = Service.objects.filter(status=status)
    else:
        services = Service.objects.all()
    
    serializer = ServiceSerializer(services, many=True, context={'request': request})
    return Response(serializer.data)


'''@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_services_by_status(request, status):
    services = Service.objects.filter(status=status)
    serializer = ServiceSerializer(services, many=True, context={'request': request})
    return Response(serializer.data)'''



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_services(request, user_id):
    status = request.query_params.get('status')
    if status:
        services = Service.objects.filter(status=status, user=user_id)
    else:
        services = Service.objects.filter(user=user_id)
    
    serializer = ServiceSerializer(services, many=True, context={'request': request})
    return Response(serializer.data)




@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_service(request, id):
    service = Service.objects.get(id=id)
    serializer = ServiceSerializer(service, context={'request': request})
    return Response(serializer.data)
