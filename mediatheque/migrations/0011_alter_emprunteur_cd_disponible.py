# Generated by Django 5.0.3 on 2024-03-13 19:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mediatheque', '0010_remove_cd_dateemprunt_remove_cd_disponible_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emprunteur_cd',
            name='disponible',
            field=models.BooleanField(null=True),
        ),
    ]
