from django.shortcuts import render
from AppEcole.models import Devoir

def liste_Etudiant(request):
    projets = Devoir.objects.filter(status='archivé')
    
    return render(request, 'etudiant/projets/index.html', {'projets': projets}) 

# Create your views here.
