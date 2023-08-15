from django.contrib import admin
from .models import CustomUser

class CustomUser(admin.ModelAdmin):
    list_display=('nom','prenom', 'description', 'categorie')    

admin.site.register(CustomUser)
# Register your models here.
