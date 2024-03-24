from django.shortcuts import render
from mediatheque.models import Emprunteur, Livre, Dvd, Cd, JeuDePlateau, Emprunteur_Livre, Emprunteur_Dvd, Emprunteur_Cd, Emprunteur_Jeu
#from mediatheque.forms import AfficheEmpruntMembre

# Create your views here.
def index(request):
    emprunteurs_et_livres = []
    emprunteurs = Emprunteur.objects.all()
    for emprunteur in emprunteurs:
        livres_empruntes = Livre.objects.filter(emprunteur_livre__emprunteurs=emprunteur)
        emprunts_Livres = Emprunteur_Livre.objects.filter(emprunteurs=emprunteur)
        dates_emprunt_livres = {emprunt_Livre.livre.name: emprunt_Livre.dateEmprunt for emprunt_Livre in emprunts_Livres}

        dvds_empruntes = Dvd.objects.filter(emprunteur_dvd__emprunteurs=emprunteur)
        emprunts_Dvds = Emprunteur_Dvd.objects.filter(emprunteurs=emprunteur)
        dates_emprunt_dvds = {emprunt_Dvd.dvd.name: emprunt_Dvd.dateEmprunt for emprunt_Dvd in emprunts_Dvds}

        cds_empruntes = Cd.objects.filter(emprunteur_cd__emprunteurs=emprunteur)
        emprunts_Cds = Emprunteur_Cd.objects.filter(emprunteurs=emprunteur)
        dates_emprunt_cds = {emprunt_Cd.cd.name: emprunt_Cd.dateEmprunt for emprunt_Cd in emprunts_Cds}

        jeux_empruntes = JeuDePlateau.objects.filter(emprunteur_jeu__emprunteurs=emprunteur)
        emprunteurs_et_livres.append({'emprunteur': emprunteur,
                                      'livres_empruntes': livres_empruntes,
                                      'dvds_empruntes': dvds_empruntes,
                                      'cds_empruntes':cds_empruntes,
                                      'jeux_empruntes':jeux_empruntes,
                                      'dates_emprunt_livres':dates_emprunt_livres,
                                      'dates_emprunt_dvds': dates_emprunt_dvds,
                                      'dates_emprunt_cds': dates_emprunt_cds})
    return render(request, 'membre.html', {'emprunteurs_et_livres':emprunteurs_et_livres})
