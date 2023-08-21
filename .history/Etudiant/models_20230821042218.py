from django.db import models
from django.contrib.auth import get_user_model

class Soumission(models.Model):
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    projet = models.FileField(upload_to='soumissions/')
    matiere = models.CharField(max_length=100)
    

    def __str__(self):
        return f"Soumission by {self.user.username} - {self.matiere}"

# Create your models here.
