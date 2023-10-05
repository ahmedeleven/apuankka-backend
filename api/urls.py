# api/urls.py
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns = [
	path('test_function/', views.test_function, name='test_function'),
	path('register/', views.register_user, name='register'),
	path('login/', views.login_user, name='login'),
	path('profile/', views.user_profile, name='profile'),
	path('current_user/', views.user_data, name='user_data'),
	path('profile/<str:username>/update/', views.update_user_profile, name='update_user_profile'),
	path('services/', views.get_services, name='get_services'),
	path('services/count/', views.count_services, name='count_services'),
	path('services/available/count/', views.count_available_services, name='count_available_services'),
	#path('services/?status=<str:status>', views.get_services_by_status, name='get_services_by_status'),
	path('services/add/', views.add_service, name='add_service'),
	path('services/update/<str:service_id>/', views.update_service, name='update_service'),
	path('services/<int:id>/', views.get_service, name='get_service'),
	path('services/user/<int:user_id>/', views.get_user_services, name='get_user_services'),
	path('services/user/<int:user_id>/count/', views.count_user_services, name='count_user_services'),
	path('interests/service/<int:service_id>/add/', views.add_interest, name='add_interest'),
	path('interests/service/<int:service_id>/delete/', views.delete_interest, name='delete_interest'),
	path('interests/service/<int:service_id>/check/', views.check_interest, name='check_interest'),
	path('interests/service/<int:service_id>/user/<int:user_id>/update/', views.update_interest, name='update_interest'),
	path('interests/service/<int:service_id>/user/<int:user_id>/check/', views.check_user_interest, name='check_user_interest'),
	path('interests/service/<int:service_id>/', views.get_service_interests, name='get_service_interests'),
	path('interests/user/<int:user_id>/count/', views.count_user_interests, name='count_user_interests'),
	path('interests/user/<int:user_id>/chosen/count/', views.count_user_interests, name='count_user_interests'),
]





if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)