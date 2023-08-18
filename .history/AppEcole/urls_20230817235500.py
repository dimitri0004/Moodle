from django.urls import path
from .views import index, inscription, connexion,ajouter_projet,deconnexion
urlpatterns = [
    path('acceuil', index, name='acceuil'),
    path('inscription/', inscription, name='register'),
    path('', connexion, name='login'),
    path('deconnexion/', deconnexion, name='logout',
    path('enseignant/projet/ajouter', ajouter_projet, name='ajouter_projet'),

]
