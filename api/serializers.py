from rest_framework import serializers
from django.contrib.auth.models import User
from .models import UserProfile
from .models import Service
from django.utils import timezone


class UserProfileSerializer(serializers.ModelSerializer):
    user_id = serializers.ReadOnlyField(source='user.id')

    class Meta:
        model = UserProfile
        fields = ('id','phone_number','user_id')

class UserSerializer(serializers.ModelSerializer):
    profile = UserProfileSerializer()

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'profile',)




class ServiceSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True, default=serializers.CurrentUserDefault())
    #user = UserSerializer()

    class Meta:
        model = Service
        fields = ('id','title','description','date','modified','fee','status','user')

    def create(self, validated_data):
        validated_data['user'] = self.context['request'].user
        validated_data['date'] = timezone.now().date()
        service = Service.objects.create(**validated_data)
        return service