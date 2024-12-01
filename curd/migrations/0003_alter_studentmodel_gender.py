# Generated by Django 5.0.1 on 2024-12-01 16:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('curd', '0002_studentmodel_gender'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentmodel',
            name='gender',
            field=models.CharField(blank=True, choices=[('M', 'Male'), ('F', 'Female')], max_length=1, null=True),
        ),
    ]