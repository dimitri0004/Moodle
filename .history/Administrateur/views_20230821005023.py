from django.shortcuts import render,redirect,get_object_or_404
from django.core.validators import validate_email
from AppEcole.models import User
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import get_user_model
from django.contrib import messages

def register(request):
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
            return redirect('liste_utilisateur')
            
    context = {
        'error': error,
        'message': message
    }
    return render(request, 'administrateur/users/inscription.html', context)   

def liste_utilisateur(request):
    users = User.objects.all()
    return render(request, 'administrateur/users/utilisateur.html', {'users': users}) 

def modifier_utilisateur(request, id):
    error = False
    message = ""
    user = get_object_or_404(get_user_model(), id=id)  # Get the user object or return 404 if not found
    
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
