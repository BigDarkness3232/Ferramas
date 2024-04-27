#Se encarga de convertir los datos
from .models import *
from rest_framework import serializers

class TipoProductoSerializers(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'


class MarcaSerializers(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = '__all__'

class ProductoSerializers(serializers.ModelSerializer):
    #Agregamos las FK
    tipo = TipoProductoSerializers(read_only = True)
    marca = MarcaSerializers(read_only = True)

    class Meta:
        model = Producto
        fields = '__all__'

class MensajeSerializers(serializers.ModelSerializer):
    class Meta:
        model = Mensaje
        fields = '__all__'



# Serializer - Viewset - url