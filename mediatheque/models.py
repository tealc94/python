from django.db import models
from django.utils import timezone

class Emprunteur(models.Model):
	id_emprunteur = models.AutoField(primary_key=True)
	name = models.CharField(max_length=100)
	bloque = models.BooleanField(null=True)

class Livre(models.Model):
	name = models.CharField(max_length=100, null=True)
	auteur = models.CharField(max_length=100, null=True)

	def __str__(self):
		return self.name

class Emprunteur_Livre(models.Model):
	dateEmprunt = models.DateField(default=timezone.now)
	disponible = models.BooleanField(null=True)
	emprunteurs = models.ForeignKey(Emprunteur, on_delete=models.CASCADE)
	livre = models.ForeignKey(Livre, on_delete=models.CASCADE, default=None)

class Dvd(models.Model):
	name = models.CharField(max_length=100)
	realisateur = models.CharField(max_length=100)

	def __str__(self):
		return self.name

class Emprunteur_Dvd(models.Model):
	dateEmprunt = models.DateField(default=timezone.now)
	disponible = models.BooleanField(null=True)
	emprunteurs = models.ForeignKey(Emprunteur, on_delete=models.CASCADE)
	dvd = models.ForeignKey(Dvd, on_delete=models.CASCADE, default=None)

class Cd(models.Model):
	name = models.CharField(max_length=100)
	artiste = models.CharField(max_length=100)

	def __str__(self):
		return self.name

class Emprunteur_Cd(models.Model):
	dateEmprunt = models.DateField(default=timezone.now)
	disponible = models.BooleanField(null=True)
	emprunteurs = models.ForeignKey(Emprunteur, on_delete=models.CASCADE)
	cd = models.ForeignKey(Cd, on_delete=models.CASCADE, default=None)

class JeuDePlateau(models.Model):
	name = models.CharField(max_length=100)
	createur = models.CharField(max_length=100)

	def __str__(self):
		return self.name

class Emprunteur_Jeu(models.Model):
	disponible = models.BooleanField(null=True)
	jeu = models.ForeignKey(JeuDePlateau, on_delete=models.CASCADE, default=None)
	emprunteurs = models.ForeignKey(Emprunteur, on_delete=models.CASCADE,default=None)
