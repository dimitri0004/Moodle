from django.shortcuts import render

def liste_Etudiant(request):
    projets = Devoir.objects.filter(status='archivé')
    
    return render(request, 'etudiant/projets/index.html', {'projets': projets}) 

# Create your views here.
