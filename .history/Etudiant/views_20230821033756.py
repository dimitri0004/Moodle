from django.shortcuts import render

def liste_Etudiant(request):
    users = User.objects.filter(status='archivé')
# Create your views here.
