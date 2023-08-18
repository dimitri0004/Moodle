from django.shortcuts import render,redirect
from django.core.validators import validate_email
from django.contrib.auth.models import User
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from .forms import ProjetForm
from django.contrib.auth import get_user_model
from .models import Devoir

def index(request):
    return render(request,'index.html')

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
        date = request.POST.get('date')# Récupérer le rôle du formulaire
        
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
                birthdate=date# Enregistrer le rôle dans le modèle
            )
            user.set_password(password)
            user.save()
            return redirect('acceuil')
            
    context = {
        'error': error,
        'message': message
    }
    return render(request, 'Utilisateur/inscription.html', context)

def connexion(request):
    error=False
    message=""
    if request.method=="POST":
      
        email=request.POST.get('email', None)
        password=request.POST.get('password', None)
        
        User = get_user_model() 
        user=User.objects.filter(email=email).first()
        if user:
            user=authenticate(username=user.username, password=password)
            if user:
                login(request, user)
                return redirect('acceuil')
            else: 
                error=True
                message="mot de passe  incorrecte"  
        else:        
            error=True
            message="l'utilisateur n'existe pas"  
    return render(request, 'Utilisateur/connexion.html', {'error':error, 'message':message})     

def ajouter_projet(request):
    if request.method == 'POST':
        form = ProjetForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('ajouter_projet')  # Rediriger vers la liste des projets
    else:
        form = ProjetForm()
    
    context = {'form': form}
    return render(request, 'Enseignant/projet.html', context)

def liste_projets(request):
    projets = Devoir.objects.all()
    return render(request, 'index.html', {'projets': projets})


def deconnexion(request):
    logout(request)  
    return redirect('login') 
# Create your views here.
