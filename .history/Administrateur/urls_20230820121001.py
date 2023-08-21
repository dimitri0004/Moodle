from django.urls import path
from .views import register
urlpatterns = [
    path('/user', register, name='inscription'),
    
    
    
    


]
