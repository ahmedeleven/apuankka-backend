# api/urls.py
from django.urls import path

from . import views

urlpatterns = [
	path('test_function/', views.test_function, name='test_function'),
	path('register/', views.register_user, name='register'),
	path('login/', views.login_user, name='login'),
	path('profile/', views.user_profile, name='profile'),
	path('profile/<str:username>/update/', views.update_user_profile, name='update_user_profile'),
	path('services/', views.get_services, name='get_services'),
	#path('services/?status=<str:status>', views.get_services_by_status, name='get_services_by_status'),
	path('services/add/', views.add_service, name='add_service'),
	path('services/update/<str:service_id>/', views.update_service, name='update_service'),
	path('services/<int:id>/', views.get_service, name='get_service'),
	path('services/user/<int:user_id>/', views.get_user_services, name='get_user_service'),
	path('interests/service/<int:service_id>/add/', views.add_interest, name='add_interest'),
	path('interests/service/<int:service_id>/user/<int:user_id>/update/', views.update_interest, name='update_interest'),
	path('interests/service/<int:service_id>/', views.get_service_interests, name='get_service_interests'),
]