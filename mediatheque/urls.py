"""
URL configuration for mediatheque project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from mediatheque import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.listeEmprunteurs, name='emprunteurs'),
    path('ajoutemprunteur/', views.ajoutEmprunteur, name='ajoutemprunteur'),
    path('updateemprunteur/<int:id>', views.updateEmprunteur, name='updateemprunteur'),
    path('deleteemprunteur/<int:id>', views.deleteEmprunteur, name='deleteemprunteur'),

    path('listemedias/', views.listeMedia, name='listemedias'),
    path('ajoutlivre/', views.ajoutLivre, name='ajoutlivre'),
    path('ajoutdvd/', views.ajoutDvd, name='ajoutdvd'),
    path('ajoutcd/', views.ajoutCd, name='ajoutcd'),
    path('ajoutjeu/', views.ajoutJeu, name='ajoutjeu'),

    path('selectionmedias/<int:emprunteurs_id>', views.selectionMedias, name='selectionmedias'),

    path('membre/', include('membre.urls'))
]
