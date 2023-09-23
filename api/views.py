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
from .serializers import UserProfileSerializer
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
def update_user_profile(request, username):  # Include 'username' as a parameter
    try:
        user = User.objects.get(username=username)
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

    # Check if the authenticated user is the same as the one being updated
    if request.user != user:
        return Response({'error': 'Unauthorized'}, status=status.HTTP_401_UNAUTHORIZED)

    serializer = UserProfileSerializer(user, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({'message': 'User profile updated successfully'})
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)