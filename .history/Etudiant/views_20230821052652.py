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
    soumission = Soumission.objects.all()  
    {''}
    return render(request, 'Etudiant/soumission/ajouter.html', context)

def modifier_soumission(request, id):
    soumission = get_object_or_404(Soumission, id=id)
    messages=""
    if request.method == 'POST':
        form = SoumissionForm(request.POST, request.FILES, instance=projet)
        if form.is_valid():
            form.save()
            form=SoumissionForm
            messages="votre soumission a été modifier avec succes"
            
            
             # Rediriger vers la liste des projets
    else:
        form = SoumissionForm(instance=soumission)
    
    context = {'form': form,
               'message':messages}
    return render(request, 'Etudiant/soumission/modifier.html', context)


def supprimer_soumission(request, id):
    messages=""
    soumission = get_object_or_404(Soumission, id=id)
    
    
    if request.method == 'POST':
        soumission.delete()
        return redirect('liste_soumission')  # Rediriger vers la liste des projets
        messages="votre Soumission a été supprimer avec succes" 
    context = {
               'soumission':soumissions,
               'message':messages}
    return render(request, 'Etudiant/soumission/supprimer.html', context)
# Create your views here.
