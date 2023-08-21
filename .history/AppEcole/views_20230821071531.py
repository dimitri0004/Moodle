from django.shortcuts import render,redirect,get_object_or_404
from django.core.validators import validate_email
from django.contrib.auth.models import User
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from .forms import ProjetForm
from django.contrib.auth import get_user_model
from .models import Devoir
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test

def is_enseignant(user):
    return user.role == 'Enseignant'

def is_not_authenticated(user):
    return not user.is_authenticated



@user_passes_test(is_enseignant, login_url='login')



def index(request):
    return render(request,'index.html')


@user_passes_test(is_enseignant, login_url='login')
def ajouter_projet(request):
    messages= ''
    if request.method == 'POST':
        form = ProjetForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            form=ProjetForm()
            messages = "votre projet a été ajouter avec succes" # Rediriger vers la liste des projets
    else:
        form = ProjetForm()
    
    context = {'form': form,'message' :messages} 
    return render(request, 'Enseignant/Projet/projet.html', context)

@user_passes_test(is_enseignant, login_url='login')
def liste_projets(request):
    projets = Devoir.objects.all()
    return render(request, 'Enseignant/Projet/index.html', {'Projets': projets})

@user_passes_test(is_enseignant, login_url='login')
def modifier_projet(request, id):
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


@user_passes_test(is_enseignant, login_url='login')
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








def inscription(request):
    error = False
    message = ""
    
    if request.method == "POST":
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
        # Récupérer le rôle du formulaire
        
        try:
            validate_email(email)
        except:
            error = True
            message = "Entrer un email valide svp"
            
        User = get_user_model()  # Obtenir le modèle utilisateur personnalisé
        
        user = User.objects.filter(Q(email=email) | Q(username=username)).first()
        if user:
            error = True
            message = f"L'email {email} ou le nom d'utilisateur {nom} est déjà utilisé par un utilisateur"
            
        if password != confirmePassword:
            error = True
            message = "Les deux mots de passe ne sont pas identiques"
            
        if error == False:
            user = User(
                
                username=username,
                email=email,
                last_name=nom,
                first_name=prenom,
                identifiant=identifiant,
                role=role,
                birthdate=date,
                profil=image# Enregistrer le rôle dans le modèle
            )
            user.set_password(password)
            user.save()
            return redirect('login')
            
    context = {
        'error': error,
        'message': message
    }
    return render(request, 'Utilisateur/inscription.html', context)

@login_required
def afficher_profil(request):
        utilisateur = request.user
        return render(request, 'Enseignant/profil.html', {'utilisateur': utilisateur})

@user_passes_test(is_not_authenticated, login_url='home')
def connexion(request):
    error=False
    messages=""
    if request.method=="POST":
      
        email=request.POST.get('email', None)
        password=request.POST.get('password', None)
        
        User = get_user_model() 
        user=User.objects.filter(email=email).first()
        if user:
            user=authenticate(username=user.username, password=password)
            if user:
                login(request, user)
                if user.role == 'Administrateur':
                    return redirect('acceuil')  # Redirection pour les superutilisateurs
                elif user.role == 'Enseignant':
                    return redirect('liste_cour')  # Redirection pour les membres du groupe "Staff"
                elif user.role == 'Etudiant':
                    return redirect('acceuil')  
                else:
                    return redirect('etudiants_projet')  # Redirection par défaut
               
            else: 
                error=True
                message="mot de passe  incorrecte"  
        else:        
            error=True
            message="l'utilisateur n'existe pas"  
    return render(request, 'Utilisateur/connexion.html', {'error':error, 'message':messages})     





def deconnexion(request):
    logout(request)  
    return redirect('login') 
# Create your views here.
