from django.db import models
class CustomUser(AbstractUser):
    ROLE_CHOICES = (
        ('student', 'Étudiant'),
        ('teacher', 'Enseignant'),
        ('admin', 'Administrateur'),
    )
    
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='student')
    birthdate = models.DateField(null=True, blank=True)
    eleve_id = models.CharField(max_length=20, null=True, blank=True)
    enseignant_id = models.CharField(max_length=20, null=True, blank=True)
    first_name = models.CharField(max_length=50)  # Ajout du prénom
    last_name = models.CharField(max_length=50)   # Ajout du nom

    def __str__(self):
        return self.username

# Create your models here.
