from django.shortcuts import render, redirect,get_object_or_404
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
    context = {'soumissions':soumission}
    return render(request, 'Etudiant/soumission/index.html', context)

def modifier_soumission(request, id):
    soumission = get_object_or_404(Soumission, id=id)
    messages=""
    if request.method == 'POST':
        form = SoumissionForm(request.POST, request.FILES, instance=soumission)
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
               'soumission':soumission,
               'message':messages}
    return render(request, 'Etudiant/soumission/supprimer.html', context)


@login_required
def afficher_profil(request):
        utilisateur = request.user
        return render(request, 'Etudiant/profil.html', {'utilisateur': utilisateur})
    
@login_required
def modifier_profil(request):
    error = False
    message = ""
    user = request.user  # Get the user object or return 404 if not found
    
    if request.method == "POST":
        # Similar to your existing code to retrieve form data
        username = request.POST.get('username')
        email = request.POST.get('email')
        nom = request.POST.get('nom')
        prenom = request.POST.get('prenom')
        password = request.POST.get('password')
        confirmePassword = request.POST.get('confirmePassword')
        role = request.POST.get('role')
        identifiant = request.POST.get('identifiant')
        date = request.POST.get('date')
        image = request.POST.get('image')

        try:
            validate_email(email)
        except:
            error = True
            message = "Entrer un email valide svp"

        existing_user = get_user_model().objects.filter(Q(email=email) | Q(username=username)).exclude(id=id).first()
        if existing_user:
            error = True
            message = f"L'email {email} ou le nom d'utilisateur {nom} est déjà utilisé par un utilisateur"

        if password and password != confirmePassword:
            error = True
            message = "Les deux mots de passe ne sont pas identiques"

        if not error:
            # Update user data
            user.username = username
            user.email = email
            user.last_name = nom
            user.first_name = prenom
            user.identifiant = identifiant
            user.role = role
            user.birthdate = date
            user.profil = image
            
            if password:
                user.set_password(password)  # Only set password if a new password is provided
            
            user.save()
            return redirect('liste_utilisateur')  # Redirect to user list page after successful update

    context = {
        'user': user,
        'error': error,
        'message': message
    }
    return render(request, 'administrateur/users/modifier.html', context)
# Create your views here.
