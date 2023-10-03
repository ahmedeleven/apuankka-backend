from django.contrib.auth.models import User
from django.db import models

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=15, blank=True, null=True)
    full_name = models.CharField(max_length=100, blank=True, null=True)
    profile_picture = models.ImageField(upload_to='profile_pictures/', blank=True, null=True)

    def __str__(self):
        return self.user.username



class Service(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    description = models.TextField(null=True)
    date = models.DateField(null=True)
    modified = models.DateField(null=True)
    fee = models.IntegerField(default=0)
    status = models.CharField(max_length=20,default="open")

    def __str__(self):
        return self.title



class Interest(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    chosen = models.BooleanField(default=False)

    def __str__(self):
        return f"Interest {self.id} by {self.user.username} for Service {self.service.id}"
