from django.urls import path
from .views import index, inscription
urlpatterns = [
    path('acceuil', index, name='acceuil'),
    path('inscription/', inscription, name='register'),
    path('connexion/', inscription, name='login'),

]
