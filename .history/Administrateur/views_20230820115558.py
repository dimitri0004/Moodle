from django.shortcuts import render

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
            return redirect('login')
            
    context = {
        'error': error,
        'message': message
    }
    return render(request, 'Utilisateur/inscription.html', context)    

# Create your views here.
