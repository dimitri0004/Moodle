from django import forms
from .models import Devoir

class ProjetForm(forms.ModelForm):
    intitule = forms.CharField(label='Intitulé', widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    matiere = forms.CharField(label='Matière', widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    projet = forms.FileField(label='Projet (Fichier)', widget=forms.ClearableFileInput(attrs={
        'class': 'form-control-file'
    }))
    statut = forms.ChoiceField(label='Statut', choices=Devoir.STATUT_CHOICES, widget=forms.Select(attrs={
        'class': 'form-control'
    }))

    class Meta:
        model = Devoir
        fields = ['intitule', 'matiere', 'projet', 'statut']
