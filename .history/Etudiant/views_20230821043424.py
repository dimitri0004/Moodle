from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import SoumissionForm  # 
from .models import Soumission

from AppEcole.models import Devoir

def liste_Projets(request):
    projets = Devoir.objects.filter(statut='archivé')
    
    return render(request, 'Etudiant/projet/index.html', {'projets': projets}) 

@login_required  # This decorator ensures only logged-in users can access this view
def add_soumission(request):
    if request.method == 'POST':
        form = SoumissionForm(request.POST, request.FILES)
        if form.is_valid():
            soumission = form.save(commit=False)  # Create an instance but don't save to the database yet
            soumission.user = request.user  # Associate the logged-in user
            soumission.save()  # Now save the instance with the associated user
            return redirect('submission_list')  # Redirect after successful submission
    else:
        form = SoumissionForm()

    context = {'form': form}
    return render(request, 'add_soumission.html', context)

# Create your views here.
