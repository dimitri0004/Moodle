from django.urls import path
from .views import register,liste_utilisateur,modifier_utilisateur,supprimer_utilisateur,liste_cour,ajouter_cour,modifier_cour,supprimer_cour
urlpatterns = [
    path('user/ajouter', register, name='inscription'),
    path('user/', liste_utilisateur, name='liste_utilisateur'),
    path('user/modifier/<int:id>',modifier_utilisateur, name='modifier_utilisateur'),
    path('user/supprimer/<int:id>',supprimer_utilisateur, name='supprimer_utilisateur'),
    path('user/ajouter', register, name='inscription'),
    path('cour/', liste_cour, name='liste_utilisateur'),
    path('user/modifier/<int:id>',modifier_utilisateur, name='modifier_utilisateur'),
    path('user/supprimer/<int:id>',supprimer_utilisateur, name='supprimer_utilisateur'),
    
    
    
    
    
    


]
