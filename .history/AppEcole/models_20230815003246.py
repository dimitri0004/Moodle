from django.db import models
from django.contrib.auth.models import AbstractUser
class User(AbstractUser):
    
    
    ROLE_CHOICES = (
        ('student', 'Etudiant'),
        ('teacher', 'Enseignant'),
        ('admin', 'Administrateur'),
    )
    
    role = models.CharField(max_length=30, choices=ROLE_CHOICES, verbose_name='Rôle')
    birthdate = models.DateField(null=True, blank=True)
    identifiant = models.CharField(max_length=20, null=True, blank=False)

    def __str__(self):
        return self.username

# Create your models here.
