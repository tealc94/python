from django.shortcuts import render, get_object_or_404, redirect, HttpResponse
from .models import Emprunteur, Livre, Dvd, Cd, JeuDePlateau, Emprunteur_Livre, Emprunteur_Jeu, Emprunteur_Dvd, Emprunteur_Cd
from mediatheque.forms import Creationemprunteur, Updateemprunteur, Creationlivre, Creationdvd, Creationcd, Creationjeu, SelectionMediasForm

import logging

logging.basicConfig(filename="log.txt",
                format='%(asctime)s - %(levelname)s - %(message)s',
                datefmt='%d-%b-%y %H:%M:%S')
logger = logging.getLogger()
logger.setLevel(logging.INFO)

## Gestion de l'emprunteur
def listeEmprunteurs(request):
    emprunteurs = Emprunteur.objects.all()
    logger.info('Accès à la liste des emprunteurs')
    return render(request, 'emprunteurs/emprunteurs.html', {'emprunteurs': emprunteurs})

def ajoutEmprunteur(request):
    if request.method == 'POST':
        creationemprunteur = Creationemprunteur(request.POST)
        if creationemprunteur.is_valid():
            emprunteur = Emprunteur()
            emprunteur.name = creationemprunteur.cleaned_data['name']
            emprunteur.save()
            logger.info("Ajout d'un nouvel emprunteur: %s" , emprunteur.name)
            emprunteurs = Emprunteur.objects.all()
        return render(request, 'emprunteurs/emprunteurs.html', {'emprunteurs': emprunteurs})
    else:
        creationemprunteur = Creationemprunteur()
    return render(request, 'emprunteurs/ajoutemprunteur.html', {'creationemprunteur': creationemprunteur})

def updateEmprunteur(request, id):
    if request.method == 'POST':
        emprunteur = Emprunteur.objects.get(pk=id)
        update_emprunteur = Updateemprunteur(request.POST)
        if update_emprunteur.is_valid():
            logger.info("Ancienne nom de l'emprunteur: %s", emprunteur.name)
            emprunteur.name = update_emprunteur.cleaned_data['name']
            emprunteur.save()
            logger.info("Mise à jour de l'emprunteur: %s", emprunteur.name)
            emprunteurs = Emprunteur.objects.all()
        return render(request, "emprunteurs/emprunteurs.html", {'emprunteurs': emprunteurs})
    else:
        update_emprunteur = Updateemprunteur()
    return render(request, 'emprunteurs/updateemprunteur.html', {'update_emprunteur': update_emprunteur})

def deleteEmprunteur(request, id):
    emprunteur = get_object_or_404(Emprunteur, pk=id)
    emprunteur.delete()
    logger.info("Suppression de l'emprunteur: %s", emprunteur.name)
    emprunteurs = Emprunteur.objects.all()
    return  render(request, 'emprunteurs/emprunteurs.html', {'emprunteurs': emprunteurs})

## Gestion des medias
def listeMedia(request):
    livres = Livre.objects.all()
    dvds = Dvd.objects.all()
    cds = Cd.objects.all()
    jeux = JeuDePlateau.objects.all()
    return render(request, 'medias/medias.html', {'livres': livres, 'dvds': dvds, 'cds': cds, 'jeux': jeux })

def ajoutLivre(request):
    if request.method == 'POST':
        creationlivre = Creationlivre(request.POST)
        if creationlivre.is_valid():
            livre = Livre()
            livre.name = creationlivre.cleaned_data['name']
            livre.auteur = creationlivre.cleaned_data['auteur']
            livre.save()
            livres = Livre.objects.all()
        return redirect('listemedias')
    else:
        creationlivre = Creationlivre()
    return render(request, 'medias/ajoutlivre.html', {'creationlivre': creationlivre})

def ajoutDvd(request):
    if request.method == 'POST':
        creationdvd = Creationdvd(request.POST)
        if creationdvd.is_valid():
            dvd = Dvd()
            dvd.name = creationdvd.cleaned_data['name']
            dvd.realisateur = creationdvd.cleaned_data['realisateur']
            dvd.save()
            dvds = Dvd.objects.all()
        return redirect('listemedias')
    else:
        creationdvd = Creationdvd()
    return render(request, 'medias/ajoutdvd.html', {'creationdvd': creationdvd})

def ajoutCd(request):
    if request.method == 'POST':
        creationcd = Creationcd(request.POST)
        if creationcd.is_valid():
            cd = Cd()
            cd.name = creationcd.cleaned_data['name']
            cd.artiste = creationcd.cleaned_data['artiste']
            cd.save()
            cds = Cd.objects.all()
        return redirect('listemedias')
    else:
        creationcd = Creationcd()
    return render(request, 'medias/ajoutcd.html', {'creationcd': creationcd})

def ajoutJeu(request):
    if request.method == 'POST':
        creationjeu = Creationjeu(request.POST)
        if creationjeu.is_valid():
            jeu = JeuDePlateau()
            jeu.name = creationjeu.cleaned_data['name']
            jeu.createur = creationjeu.cleaned_data['createur']
            jeu.save()
            jeux = JeuDePlateau.objects.all()
        return redirect('listemedias')
    else:
        creationjeu = Creationjeu()
    return render(request, 'medias/ajoutjeu.html', {'creationjeu': creationjeu})

def selectionMedias(request, emprunteurs_id):
    emprunteur = Emprunteur.objects.get(pk=emprunteurs_id)
    livres_empruntes = Emprunteur_Livre.objects.filter(emprunteurs=emprunteur)
    dvds_emprunteur = Emprunteur_Dvd.objects.filter(emprunteurs=emprunteur)
    cds_emprunteur = Emprunteur_Cd.objects.filter(emprunteurs=emprunteur)
    jeux_emprunteur = Emprunteur_Jeu.objects.filter(emprunteurs=emprunteur)
    message = None
    message_emprunt_livre = None
    message_emprunt_dvd = None
    message_emprunt_cd = None
    message_emprunt_jeu = None
    if request.method == 'POST':
        form = SelectionMediasForm(request.POST)
        if form.is_valid():
            livres_selectionnes = form.cleaned_data['livres']
            dvds_selectionnes = form.cleaned_data['dvds']
            cds_selectionnes = form.cleaned_data['cds']
            jeux_selectionnes = form.cleaned_data['jeux']
            total_medias = (len(livres_selectionnes)+len(dvds_selectionnes)+len(cds_selectionnes))

            #lors de la remise du médias, mise à jour dans la table
            livres_empruntes = Emprunteur_Livre.objects.filter(emprunteurs=emprunteur)
            for livre_emprunte in livres_empruntes:
                if livre_emprunte not in livres_selectionnes:
                    livre_emprunte.delete()

            dvd_empruntes = Emprunteur_Dvd.objects.filter(emprunteurs=emprunteur)
            for dvd_emprunte in dvd_empruntes:
                if dvd_emprunte not in dvds_selectionnes:
                    dvd_emprunte.delete()

            cd_empruntes = Emprunteur_Cd.objects.filter(emprunteurs=emprunteur)
            for cd_emprunte in cd_empruntes:
                if cd_emprunte not in cds_selectionnes:
                    cd_emprunte.delete()

            jeu_empruntes = Emprunteur_Jeu.objects.filter(emprunteurs=emprunteur)
            for jeu_emprunte in jeu_empruntes:
                if jeu_emprunte not in jeux_selectionnes:
                    jeu_emprunte.delete()

            #vérification si les médias sont déjà emprunté
            livres_a_emprunter = []
            for livre in livres_selectionnes:
                livre_deja_emprunte = Emprunteur_Livre.objects.filter(livre=livre, disponible=True).exists()
                if not livre_deja_emprunte:
                    livres_a_emprunter.append(livre)
                else:
                    message_emprunt_livre = f'Le livre "{livre.name}" est déjà emprunté par une autre membre.'

            dvds_a_emprunter = []
            for dvd in dvds_selectionnes:
                dvd_deja_emprunte = Emprunteur_Dvd.objects.filter(dvd=dvd, disponible=True).exists()
                if not dvd_deja_emprunte:
                    dvds_a_emprunter.append(dvd)
                else:
                    message_emprunt_dvd = f'Le dvd "{dvd.name}" est déjà emprunté par une autre membre.'

            cds_a_emprunter = []
            for cd in cds_selectionnes:
                cd_deja_emprunte = Emprunteur_Cd.objects.filter(cd=cd, disponible=True).exists()
                if not cd_deja_emprunte:
                    cds_a_emprunter.append(cd)
                else:
                    message_emprunt_cd = f'Le cd "{cd.name}" est déjà emprunté par un autre membre.'

            jeux_a_emprunter = []
            for jeu in jeux_selectionnes:
                jeu_deja_emprunte = Emprunteur_Jeu.objects.filter(jeu=jeu, disponible=True).exists()
                print("JEU ", jeu_deja_emprunte)
                if not jeu_deja_emprunte:
                    jeux_a_emprunter.append(jeu)
                else:
                    message_emprunt_jeu = f'Le jeu "{jeu.name}" est déjà emprunté par un autre membre.'

            #vérification si le nbre de médias a bien été emprunté
            #si c'est le cas il est enregistré dans la base de données
            if total_medias > 3:
                message = 'Vous ne pouvez pas emprunter plus de 3 articles'
            else:
                for livre in livres_a_emprunter:
                    Emprunteur_Livre.objects.create(emprunteurs=emprunteur, livre=livre, disponible=True)
                    logger.info("Livre %s prêté à %s", livre.name, emprunteur.name)
                for dvd in dvds_a_emprunter:
                    Emprunteur_Dvd.objects.create(emprunteurs=emprunteur, dvd=dvd, disponible=True)
                    logger.info("DVD %s prêté à %s", dvd.name, emprunteur.name)
                for cd in cds_a_emprunter:
                    Emprunteur_Cd.objects.create(emprunteurs=emprunteur, cd=cd, disponible=True)
                    logger.info("CD %s prêté à %s", cd.name, emprunteur.name)
                for jeu in jeux_a_emprunter:
                    Emprunteur_Jeu.objects.create(emprunteurs=emprunteur, jeu=jeu, disponible=True)
                    logger.info("Jeu %s prêté à %s", jeu.name, emprunteur.name)
                return  render(request, 'empruntmedias/selectionmedias.html', {'form': form,
                                                                               'total_medias': total_medias,
                                                                               'message_emprunt_livre': message_emprunt_livre,
                                                                               'message_emprunt_dvd': message_emprunt_dvd,
                                                                               'message_emprunt_cd': message_emprunt_cd,
                                                                               'message_emprunt_jeu': message_emprunt_jeu})
    else:
        form = SelectionMediasForm(initial={'livres': [livre.livre for livre in livres_empruntes],
                                            'dvds': [dvd.dvd for dvd in dvds_emprunteur],
                                            'cds': [cd.cd for cd in cds_emprunteur],
                                            'jeux': [jeu.jeu for jeu in jeux_emprunteur]})
    return render(request, 'empruntmedias/selectionmedias.html', {'form': form, 'message': message})

