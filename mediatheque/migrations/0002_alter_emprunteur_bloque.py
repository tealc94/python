# Generated by Django 5.0.3 on 2024-03-09 13:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mediatheque', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emprunteur',
            name='bloque',
            field=models.BooleanField(null=True),
        ),
    ]
