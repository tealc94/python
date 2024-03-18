from django import forms
from .models import Livre, Dvd, Cd, JeuDePlateau, Emprunteur

class Creationemprunteur(forms.Form):
    name = forms.CharField(required=False)

class Updateemprunteur(forms.Form):
    name = forms.CharField(required=False)

class Creationlivre(forms.Form):
    name = forms.CharField(required=False)
    auteur = forms.CharField(required=False)

class Creationdvd(forms.Form):
    name = forms.CharField(required=False)
    realisateur = forms.CharField(required=False)

class Creationcd(forms.Form):
    name = forms.CharField(required=False)
    artiste = forms.CharField(required=False)

class Creationjeu(forms.Form):
    name = forms.CharField(required=False)
    createur = forms.CharField(required=False)

class SelectionMediasForm(forms.Form):
    livres = forms.ModelMultipleChoiceField(queryset=Livre.objects.all(), widget=forms.CheckboxSelectMultiple, required=False)
    dvds = forms.ModelMultipleChoiceField(queryset=Dvd.objects.all(), widget=forms.CheckboxSelectMultiple, required=False)
    cds = forms.ModelMultipleChoiceField(queryset=Cd.objects.all(), widget=forms.CheckboxSelectMultiple, required=False)
    jeux = forms.ModelMultipleChoiceField(queryset=JeuDePlateau.objects.all(), widget=forms.CheckboxSelectMultiple, required=False)
