from rest_framework import serializers
from django.contrib.auth.models import User
from .models import UserProfile
from .models import Service
from .models import Interest
from django.utils import timezone


class UserProfileSerializer(serializers.ModelSerializer):
    #user_id = serializers.ReadOnlyField(source='user.id')
    profile_picture_url = serializers.SerializerMethodField()

    class Meta:
        model = UserProfile
        fields = ('id','phone_number','full_name','bio','profile_picture', 'profile_picture_url')


    def get_profile_picture_url(self, obj):
        request = self.context.get('request')
        if obj.profile_picture:
            # Get the relative URL from obj.profile_picture.url
            relative_url = obj.profile_picture.url
            # Prepend '/api/' to the relative URL
            api_relative_url = f'/api{relative_url}'
            return request.build_absolute_uri(api_relative_url)
        return None

class UserSerializer(serializers.ModelSerializer):
    profile = UserProfileSerializer(source='userprofile', read_only=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'profile',)




class ServiceSerializer(serializers.ModelSerializer):
    #user = serializers.PrimaryKeyRelatedField(read_only=True, default=serializers.CurrentUserDefault())
    user = UserSerializer()

    class Meta:
        model = Service
        fields = ('id','title','description','date','modified','fee','status','user')

    def create(self, validated_data):
        validated_data['user'] = self.context['request'].user
        validated_data['date'] = timezone.now().date()
        service = Service.objects.create(**validated_data)
        return service



class InterestSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    service = ServiceSerializer()

    class Meta:
        model = Interest
        fields = ('id', 'user', 'service', 'chosen')




class InterestUserOnlySerializer(serializers.ModelSerializer):
    user = UserSerializer()  # Use your UserSerializer to serialize user data
    service_id = serializers.ReadOnlyField(source='service.id')  # Include the 'service_id' field
    
    class Meta:
        model = Interest
        fields = ('service_id', 'user', 'chosen')
