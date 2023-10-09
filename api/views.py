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
from .models import Interest
from .serializers import UserProfileSerializer
from .serializers import ServiceSerializer
from .serializers import UserSerializer
from .serializers import InterestSerializer
from .serializers import InterestUserOnlySerializer

from django.utils import timezone

from django.shortcuts import get_object_or_404

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
        UserProfile.objects.create(user=user)
    except Exception as e:
        return Response({'error': str(e), 'username': username}, status=status.HTTP_400_BAD_REQUEST)

    # Get the user's ID and username
    user_id = user.id
    username = user.username

    # Generate or retrieve the authentication token
    token, _ = Token.objects.get_or_create(user=user)

    # Return the token, user ID, and username in the response
    return Response({
        'token': token.key,
        'user_id': user_id,
        'username': username
    }, status=status.HTTP_201_CREATED)









@api_view(['POST'])
def login_user(request):
    username = request.data.get('username')
    password = request.data.get('password')

    user = authenticate(request, username=username, password=password)

    if user is not None:
        # Authenticate the user
        login(request, user)

        # Get the user's ID and username
        user_id = user.id
        username = user.username

        # Generate or retrieve the authentication token
        token, _ = Token.objects.get_or_create(user=user)

        # Return the token, user ID, and username in the response
        return Response({
            'token': token.key,
            'user_id': user_id,
            'username': username
        }, status=status.HTTP_200_OK)

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
    serializer = UserProfileSerializer(user_profile, context={'request': request})
    return Response(serializer.data)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_data(request):
    user_data = User.objects.get(id=request.user.id)
    serializer = UserSerializer(user_data, context={'request': request})
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

    serializer = UserProfileSerializer(user_profile, data=request.data, context={'request': request})

    if serializer.is_valid():

        serializer.save()

        return Response({'message': 'User profile updated successfully', 'user': serializer.data})
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
        services = Service.objects.filter(status=status).order_by('-id')
    else:
        services = Service.objects.all().order_by('-id')
    
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





@api_view(['POST'])
@permission_classes([IsAuthenticated])
def add_interest(request, service_id):
    try:
        service = Service.objects.get(id=service_id)
    except Service.DoesNotExist:
        return Response({'error': 'Service does not exist'}, status=status.HTTP_404_NOT_FOUND)

    if service.user == request.user:
        return Response({"message":"You are not allowed to show interest to your own service"}, status=status.HTTP_400_BAD_REQUEST)
    else:
        interest, created = Interest.objects.get_or_create(user=request.user, service=service)
    
        if not created:
            return Response({'message': 'You have already expressed interest in this service.'})

        return Response({'message': 'Interest added successfully'}) 




@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete_interest(request, service_id):
    try:
        service = Service.objects.get(id=service_id)
    except Service.DoesNotExist:
        return Response({'error': 'Service does not exist'}, status=status.HTTP_404_NOT_FOUND)

    try:
        interest = Interest.objects.get(user=request.user, service=service)
        interest.delete()
        return Response({'message': 'Interest removed successfully'})
    except Interest.DoesNotExist:
        return Response({'message': 'You have not expressed interest in this service.'}, status=status.HTTP_404_NOT_FOUND)





@api_view(['GET'])
@permission_classes([IsAuthenticated])
def check_interest(request, service_id):
    try:
        service = Service.objects.get(id=service_id)
    except Service.DoesNotExist:
        return Response({'error': 'Service does not exist'}, status=status.HTTP_404_NOT_FOUND)

    user = request.user
    try:
        # Check if the user has already shown interest in this service
        interest = Interest.objects.get(user=user, service=service)
        is_interested = True
    except Interest.DoesNotExist:
        is_interested = False

    return Response({'is_interested': is_interested})




@api_view(['GET'])
@permission_classes([IsAuthenticated])
def check_user_interest(request, service_id, user_id):
    try:
        interest = Interest.objects.get(service=service_id, user=user_id)
        serializer = InterestSerializer(interest, context={'request': request})
    except interest.DoesNotExist:
        return Response({'error': 'This user is not interested in this service'}, status=status.HTTP_404_NOT_FOUND)


    return Response({'data': serializer.data})





@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_interest(request, service_id, user_id):
    try:
        service = Service.objects.get(id=service_id)
        #return Response({'id':service.id, 'user':service.user.id, 'logged':request.user.id, 'title': service.title})
    except Service.DoesNotExist:
        return Response({'error': 'Service does not exist'}, status=status.HTTP_404_NOT_FOUND)



    try:
        interest = Interest.objects.get(service_id=service_id,user_id=user_id)
        #return Response({'user':interest.user.id, 'service':interest.service.id})
    except:
        return Response({'error': 'There is no interest with the user specified to the service specified'}, status=status.HTTP_404_NOT_FOUND)


    if service.user != request.user:
        return Response({"message":"You are not allowed to update interests related to this service"}, status=status.HTTP_400_BAD_REQUEST)
    else:
        serializer = InterestSerializer(interest, data=request.data, partial=True, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response({'chosen': serializer.data['chosen']})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)






@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_service_interests(request, service_id):
    service = get_object_or_404(Service, id=service_id)

    if service.user == request.user:
        interests = Interest.objects.filter(service=service).select_related('user')
        serializer = InterestUserOnlySerializer(interests, many=True, context={'request':request})
        return Response(serializer.data)
    else:
        return Response({"message": "You are not allowed to display interests of this service"})




@api_view(['GET'])
@permission_classes([IsAuthenticated])
def count_services(request):

    service_count = Service.objects.all().count()

    # Return the count as a JSON response
    data = {'service_count': service_count}
    return Response(data)



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def count_available_services(request):

    service_count = Service.objects.filter(status="open").count()

    # Return the count as a JSON response
    data = {'service_count': service_count}
    return Response(data)




@api_view(['GET'])
@permission_classes([IsAuthenticated])
def count_user_services(request, user_id):

    service_count = Service.objects.filter(user=user_id).count()

    # Return the count as a JSON response
    data = {'service_count': service_count}
    return Response(data)



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def count_user_interests(request, user_id):

    # Count the interests related to the current user
    interest_count = Interest.objects.filter(user=user_id).count()

    # Return the count as a JSON response
    data = {'interest_count': interest_count}
    return Response(data)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def count_chosen_interests(request ,user_id):

    # Count the interests related to the current user where chosen=1
    chosen_interest_count = Interest.objects.filter(user=user_id, chosen=True).count()

    # Return the count as a JSON response
    data = {'chosen_interest_count': chosen_interest_count}
    return Response(data)




@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_interests(request, user_id):
    interests = Interest.objects.filter(user=user_id)
    
    serializer = InterestSerializer(interests, many=True, context={'request': request})
    return Response(serializer.data)





    
