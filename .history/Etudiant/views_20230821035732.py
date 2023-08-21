from django.shortcuts import render
from AppEcole.models import Devoir

def liste_Projets(request):
    projets = Devoir.objects.filter(statut='archivé')
    
    return render(request, 'Etudiant/projet/index.html', {'projets': projets}) 

# Create your views here.
