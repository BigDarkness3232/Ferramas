from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm

class CreacionUsuarioForm(UserCreationForm):
    first_name = forms.CharField(min_length=2,widget=forms.TextInput(attrs={"placeholder":"Ingrese su nombre"}))
    last_name = forms.CharField(min_length=2,widget=forms.TextInput(attrs={"placeholder":"Ingrese su apellido"}))
    direccion = forms.CharField(min_length=2,widget=forms.TextInput(attrs={"placeholder":"Ingrese su direccion"}))
    email = forms.CharField(min_length=2,widget=forms.TextInput(attrs={"placeholder":"Ingrese su email"}))
    username = forms.CharField(min_length=2,widget=forms.TextInput(attrs={"placeholder":"Ingrese su nombre de usuario (Se usará para ingresar)"}))
    class Meta:
        model = Usuario
        fields = ['first_name', 'last_name',  'direccion', 'email', 'username', 'password1', 'password2']

class ProductoForm(forms.Form):
    id = forms.CharField(max_length=20, label="id")
    imagen = forms.CharField()   # type: ignore
    nombre = forms.CharField()
    descripcion = forms.CharField(max_length=200)
    id_marca = forms.IntegerField()
    nombre_marca = forms.CharField()
    precio = forms.IntegerField()
    stock = forms.IntegerField()


class EstadoOdenForm(ModelForm):
    
    class Meta:
        model = Orden
        fields = ['estado_orden']

class FormularioDonacion(ModelForm):
    monto_a_donar = forms.IntegerField(min_value=1000,widget=forms.NumberInput(attrs={"placeholder":"Ingrese monto a donar. Minimo $1000 CLP"}))
    
    class Meta:
        model = Donacion
        fields = ['monto_a_donar']