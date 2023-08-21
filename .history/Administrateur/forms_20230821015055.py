from django import forms
from .models import Cour

class CourForm(forms.ModelForm):
    class Meta:
        model = Cour
        fields = ['intitule', 'code', 'enseignant']