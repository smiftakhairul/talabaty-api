# Generated by Django 4.2.2 on 2023-06-17 13:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('talabaty', '0004_alter_userprofile_profile_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='banner_image',
            field=models.ImageField(max_length=255, null=True, upload_to='banner_images/'),
        ),
    ]
