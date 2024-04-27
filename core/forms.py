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

class ProductoForm(ModelForm):

    nombre = forms.CharField(min_length=4,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    descripcion = forms.CharField(min_length=10,max_length=200,widget=forms.Textarea(attrs={"rows":4}))
    precio = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Precio"}))
    stock = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Stock"}))
    
    class Meta:
        model = Producto
        fields = ['imagen', 'nombre', 'marca', 'descripcion', 'precio', 'stock', 'tipo']
        


class MensajeForm(ModelForm):

    nombre = forms.CharField(min_length=4,widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre del mensaje"}))
    descripcion = forms.CharField(min_length=10,max_length=200,widget=forms.Textarea(attrs={"rows":4}))


    class Meta:
        model = Mensaje
        fields = '__all__'
        widgets = {
            'creado_en' : forms.SelectDateWidget(years=range(2020,2030)),
            'modificado_en' : forms.SelectDateWidget(years=range(2020,2030))
        }

class EstadoOdenForm(ModelForm):
    
    class Meta:
        model = Orden
        fields = ['estado_orden']

class FormularioDonacion(ModelForm):
    monto_a_donar = forms.IntegerField(min_value=1000,widget=forms.NumberInput(attrs={"placeholder":"Ingrese monto a donar. Minimo $1000 CLP"}))
    
    class Meta:
        model = Donacion
        fields = ['monto_a_donar']