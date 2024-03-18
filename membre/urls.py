from django.urls import path
from . import views

urlpatterns = [
    #path('<int:emprunteurs_id>/', views.index, name='index'),
    path('', views.index, name='index'),
]
