from django.urls import path
from .views import register,liste_utilisateur
urlpatterns = [
    path('/user', register, name='inscription'),
    path('/', liste_utilisateur, name='liste_utilisateur'),
    
    
    
    
    


]
