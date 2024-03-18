# Generated by Django 5.0.3 on 2024-03-13 19:32

import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mediatheque', '0009_alter_emprunteur_dvd_dateemprunt_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cd',
            name='dateEmprunt',
        ),
        migrations.RemoveField(
            model_name='cd',
            name='disponible',
        ),
        migrations.CreateModel(
            name='Emprunteur_Cd',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dateEmprunt', models.DateField(default=django.utils.timezone.now)),
                ('disponible', models.BooleanField()),
                ('cd', models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='mediatheque.cd')),
                ('emprunteurs', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mediatheque.emprunteur')),
            ],
        ),
    ]
