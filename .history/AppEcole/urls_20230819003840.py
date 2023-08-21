from django.urls import path
from .views import index, inscription, connexion,ajouter_projet,deconnexion,liste_projets,modifier_projet,supprimer_projet
urlpatterns = [
    path('acceuil', index, name='acceuil'),
    path('inscription/', inscription, name='register'),
    path('', connexion, name='login'),
    path('deconnexion/', deconnexion, name='logout'),
    
    
    path('enseignant/projet/ajouter', ajouter_projet, name='ajouter_projet'),
    path('enseignant/projet/', liste_projets, name='liste_projet'),
    path('enseignant/projet/modifier/<int:id>',modifier_projet, name='modifier_projet'),
    path('enseignant/projet/supprimer/<int:id>',supprimer_projet, name='supprimer_projet'),


]
