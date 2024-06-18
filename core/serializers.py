#Se encarga de convertir los datos
from .models import *
from rest_framework import serializers



class MarcaSerializers(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = '__all__'

class ProductoSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = Producto
        fields = '__all__'




# Serializer - Viewset - url