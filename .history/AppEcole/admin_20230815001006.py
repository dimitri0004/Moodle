from django.contrib import admin
from .models import CustomUser

class CustomUserAdmin(admin.ModelAdmin):
    list_display=('nom','prenom', 'identifiant')    

admin.site.register(CustomUser)
# Register your models here.
