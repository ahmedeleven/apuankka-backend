# Generated by Django 5.0.dev20230322100140 on 2023-09-25 10:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_alter_service_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='service',
            name='fee',
            field=models.IntegerField(default=0),
        ),
    ]
