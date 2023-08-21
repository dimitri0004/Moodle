from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import SoumissionForm  # 
from .models import Soumission

from AppEcole.models import Devoir

def liste_Projets(request):
    projets = Devoir.objects.filter(statut='archivé')
    
    return render(request, 'Etudiant/projet/index.html', {'projets': projets}) 

@login_required  # This decorator ensures only logged-in users can access this view
def ajouter_soumission(request):
    if request.method == 'POST':
        form = SoumissionForm(request.POST, request.FILES)
        if form.is_valid():
            soumission = form.save(commit=False)  # Create an instance but don't save to the database yet
            soumission.user = request.user  # Associate the logged-in user
            soumission.save()  # Now save the instance with the associated user
            form =SoumissionForm()  # Redirect after successful submission
    else:
        form = SoumissionForm()

    context = {'form': form}
    return render(request, 'Etudiant/soumission/ajouter.html', context)

def liste_soumission(request):
    projets = Soumission.objects.all()  
    return render(request, 'Etudiant/soumission/ajouter.html', context)

def modifier_soumission(request, id):
    projet = get_object_or_404(Devoir, id=id)
    messages=""
    if request.method == 'POST':
        form = ProjetForm(request.POST, request.FILES, instance=projet)
        if form.is_valid():
            form.save()
            form=ProjetForm
            messages="votre projet a été modifier avec succes"
            
            
             # Rediriger vers la liste des projets
    else:
        form = ProjetForm(instance=projet)
    
    context = {'form': form,
               'message':messages}
    return render(request, 'Enseignant/Projet/modifier.html', context)


def supprimer_projet(request, id):
    messages=""
    projet = get_object_or_404(Devoir, id=id)
    intitule=projet.intitule
    
    if request.method == 'POST':
        projet.delete()
        return redirect('liste_projet')  # Rediriger vers la liste des projets
        messages="votre projet a été supprimer avec succes" 
    context = {'intitule': intitule,
               'projet':projet,
               'message':messages}
    return render(request, 'Enseignant/Projet/supprimer.html', context)
# Create your views here.
