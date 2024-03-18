# Generated by Django 5.0.3 on 2024-03-09 13:43

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Emprunteur',
            fields=[
                ('id_emprunteur', models.CharField(max_length=100, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('bloque', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='JeuDePlateau',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('createur', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Dvd',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('realisateur', models.CharField(max_length=100)),
                ('dateEmprunt', models.DateField()),
                ('disponible', models.BooleanField()),
                ('id_emprunteur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mediatheque.emprunteur')),
            ],
        ),
        migrations.CreateModel(
            name='Cd',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('artiste', models.CharField(max_length=100)),
                ('dateEmprunt', models.DateField()),
                ('disponible', models.BooleanField()),
                ('id_emprunteur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mediatheque.emprunteur')),
            ],
        ),
        migrations.CreateModel(
            name='Livre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('auteur', models.CharField(max_length=100)),
                ('dateEmprunt', models.DateField()),
                ('disponible', models.BooleanField()),
                ('id_emprunteur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mediatheque.emprunteur')),
            ],
        ),
    ]