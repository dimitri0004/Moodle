from django.urls import path
from .views import register,liste_utilisateur,modifier_utilisateur,supprimer_utilisateur
urlpatterns = [
    path('user/ajouter', register, name='inscription'),
    path('user/', liste_utilisateur, name='liste_utilisateur'),
    path('user/modifier/<int:id>',modifier_utilisateur, name='modifier_utilisateur'),
    path('user/supprimer/<int:id>',supprimer_utilisateur, name='supprimer_utilisateur'),
    
    
    
    
    
    


]
