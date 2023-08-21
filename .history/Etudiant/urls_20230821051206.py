from django.urls import path
from .views import liste_Projets,ajouter_soumission
urlpatterns = [
    path('projets/', liste_Projets, name='etudiants_projet'),
    path('soumission/ajouter', ajouter_soumission, name='ajouter_soumission'),
    path('soumission/modifier/<int:id>', modifier_soumission, name='ajouter_soumission'),
    path('soumission/ajouter', ajouter_soumission, name='ajouter_soumission'),
    
    
    
    
    
    


]
