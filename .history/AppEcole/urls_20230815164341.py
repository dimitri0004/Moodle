from django.urls import path
from .views import index, inscription, connexion
urlpatterns = [
    path('acceuil', index, name='acceuil'),
    path('inscription/', inscription, name='register'),
    path('connexion/', connexion, name='login'),

]
