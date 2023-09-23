# api/urls.py
from django.urls import path

from . import views

urlpatterns = [
	path('test_function/', views.test_function, name='test_function'),
	path('register/', views.register_user, name='register'),
	path('login/', views.login_user, name='login'),
	path('profile/', views.user_profile, name='profile'),
	path('profile/<str:username>/update/', views.update_user_profile, name='update_user_profile'),
	path('services/add/', views.add_service, name='add_service'),
	path('services/update/<str:service_id>/', views.update_service, name='update_service'),
]