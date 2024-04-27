from django.contrib import admin
from .models import *

# Register your models here.

class TipoProductoAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = ['id', 'nombreTipoProducto']
    list_editable = ['nombreTipoProducto']

class MarcaAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = ['id', 'nombre_marca']
    list_editable = ['nombre_marca']

class ProductoAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = ['nombre', 'marca', 'descripcion', 'precio', 'stock', 'tipo', 'creado_en', 'modificado_en', 'imagen']
    list_editable = ['marca', 'descripcion', 'precio', 'stock', 'tipo', 'imagen']

    list_per_page = 10
    search_fields = ['nombre']
    list_filter = ['tipo']

class CarritoAdmin(admin.ModelAdmin):
    readonly_fields = ("id",)
    list_display = ['id_usuario', 'producto_carrito','cantidad_prod']
    list_editable = ['producto_carrito','cantidad_prod']

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
admin.site.register(TipoProducto, TipoProductoAdmin )
admin.site.register(Marca, MarcaAdmin )
admin.site.register(Mensaje, MensajeAdmin)
admin.site.register(Producto, ProductoAdmin )
admin.site.register(Carrito, CarritoAdmin)
admin.site.register(Suscripcion)
admin.site.register(EstadoOrden)
admin.site.register(Orden, OrdenAdmin)
admin.site.register(OrdenProducto)
admin.site.register(Donacion)



#<!-- {% if user.username == 'admin' %} -->

