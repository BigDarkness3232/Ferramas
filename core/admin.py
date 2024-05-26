from django.contrib import admin
from .models import *

# Register your models here.



class MarcaAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = ['id', 'nombre_marca']
    list_editable = ['nombre_marca']

class ProductoAdmin(admin.ModelAdmin):
    readonly_fields = ("codigo",)
    list_display = ['nombre', 'id_marca','descripcion', 'precio', 'stock','imagen']
    list_editable = [ 'id_marca','descripcion', 'precio', 'stock','imagen' ]

    list_per_page = 10
    search_fields = ['nombre']


class MensajeAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = [ 'nombre','descripcion', 'imagen']
    list_editable = [ 'descripcion', 'imagen']

    list_per_page = 10

class OrdenAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = ['id_usuario', 'precio_orden', 'estado_orden', 'creado_en', 'modificado_en', 'descuento_sub', 'direccion_envio']
    list_editable = ['precio_orden', 'estado_orden', 'direccion_envio']

admin.site.register(Usuario)
admin.site.register(Marca, MarcaAdmin )
admin.site.register(Mensaje, MensajeAdmin)
admin.site.register(Producto, ProductoAdmin )
admin.site.register(Carrito)
admin.site.register(Suscripcion)
admin.site.register(EstadoOrden)
admin.site.register(Orden, OrdenAdmin)
admin.site.register(OrdenProducto)
admin.site.register(Donacion)




