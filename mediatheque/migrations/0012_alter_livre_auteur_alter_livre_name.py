# Generated by Django 5.0.3 on 2024-03-14 18:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mediatheque', '0011_alter_emprunteur_cd_disponible'),
    ]

    operations = [
        migrations.AlterField(
            model_name='livre',
            name='auteur',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='livre',
            name='name',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
