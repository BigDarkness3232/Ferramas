from django.db import models
from django.contrib.auth.models import User, AbstractUser
from datetime import datetime
# Create your models here.

class Usuario(AbstractUser):
    direccion = models.CharField(max_length=100, null=True, blank=True)
    
    def __str__(self):
        return self.first_name
    


class Marca(models.Model):

    nombre_marca = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre_marca

class Producto(models.Model):
    codigo =models.IntegerField()
    imagen = models.ImageField(upload_to="productos", blank=True, null=True)
    nombre = models.CharField(max_length=50)
    id_marca = models.IntegerField()
    nombre_marca = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=500)
    precio = models.IntegerField()
    stock = models.IntegerField()

    def __str__(self):
        return self.nombre


class Mensaje(models.Model):
    imagen = models.ImageField(upload_to="mensajes", blank=True, null=True)
    nombre = models.CharField(max_length = 50)
    descripcion = models.CharField(max_length = 150)
    creado_en = models.DateField()
    modificado_en = models.DateField(blank=True, null=True)
    def __str__(self):
        return self.nombre    

#class ProductoEspecial(models.Model):
class CarroProducto(models.Model):
    Producto = models.ForeignKey(Producto,on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)
    usuario =models.ForeignKey(Usuario, on_delete=models.CASCADE)



class Carrito(models.Model):
    
    usuario = models.OneToOneField(Usuario,on_delete=models.CASCADE)
    productos = models.ManyToManyField(CarroProducto)
    
    def total (self):
        total = 0
        for x in self.productos.all():
            total += x.subtotal()
        return total
    

class EstadoOrden(models.Model):
    estado_orden = models.CharField(max_length=50)
    def __str__(self):
        return str(self.estado_orden)

class Orden(models.Model):
    id_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    precio_orden = models.IntegerField(default=0, null=True, blank=True)
    estado_orden = models.ForeignKey(EstadoOrden, on_delete=models.CASCADE)
    creado_en = models.DateField()
    modificado_en = models.DateField(blank=True, null=True)
    descuento_sub = models.IntegerField(default=0)
    direccion_envio = models.CharField(max_length=100)
    def __str__(self):
        return str(self.id_usuario)

class OrdenProducto(models.Model):
    orden = models.ForeignKey(Orden, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad_prod = models.IntegerField(default=1)

    class Meta:
        unique_together = ('orden', 'producto')

    def __str__(self):
        return str(self.orden)
    
    @property
    def subtotal_producto(self):
        precio = self.producto.precio * self.cantidad_prod
        return precio

class Suscripcion(models.Model):
    id_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    suscrito_el = models.DateField()
    renovacion_el = models.DateField(blank=True, null=True)
    
    def __str__(self):
        return str(self.id_usuario)
    
    @property
    def estado_sub(self):
        #Si la fecha de hoy es mayor que la de renovacion entonces 
        if datetime.now().date() >= self.renovacion_el :
            return False
        else:
            return True

class Donacion(models.Model):
    id_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    monto_a_donar = models.IntegerField()
    def __str__(self):
        return self.id_usuario