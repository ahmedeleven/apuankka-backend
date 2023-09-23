# api/urls.py
from django.urls import path

from . import views

urlpatterns = [
	path('test_function/', views.test_function, name='test_function'),
	path('register/', views.register_user, name='register'),
	path('login/', views.login_user, name='login'),
	path('profile/', views.user_profile, name='profile'),
	path('profile/<str:username>/update/', views.update_user_profile, name='update_user_profile'),
]