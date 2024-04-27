from django.urls import path, include
from .views import *
from rest_framework import routers

#Creacion de las rutas para la api
router = routers.DefaultRouter()

router.register('productos', ProductoViewset)
router.register('tipo_productos', TipoProductoViewset)
router.register('marcas', MarcaViewset)
router.register('mensajes', MensajeViewset)

urlpatterns = [

        #Api
        path('api/', include(router.urls)),
        path('productos/todos/', todosAPI, name="todos_api"),
    	path('', index, name="index"),
        path('registro/', registro, name='registro'),
        # Productos
        path('productos/arbustos/', arbustos, name="arbustos"),
		path('productos/flores/', flores, name="flores"),
        path('productos/herramientas/', herramientas, name="herramientas"),
        path('productos/macetas/', macetas, name="macetas"),
        path('productos/sustratos/', sustratos, name="sustratos"),
        # Fundacion/Donar/Sub
        path('fundacion/', fundacion, name="fundacion"),
        path('subscripcion/', subscripcion, name="subscripcion"),
        path('add_subs/', agregar_sub, name="agregar_sub"),
        # CRUD
        path('agregar/', agregar, name="agregar"),
        path('modificar/<id>/', modificar, name="modificar"),
        path('eliminar/<id>/', eliminar, name="eliminar"),
        # Administracion
        path('menuadmin/', menuadmin , name="menuadmin"),
        #Carrito
        path('carrito/', carrito, name="carrito"),
        path('car_agregar/<id>/', car_agregar, name="carrito_agregar"),
        path('car_una_cantidad_menos/<id>/', car_una_cantidad_menos, name="carrito_menos"),
        path('car_eliminar/<id>/', car_eliminar, name="carrito_eliminar"),
        path('car_eliminartodo/', car_eliminar_todo, name="carrito_borra_todo"),
        #Perfil
        path('perfil/', perfil, name="perfil"),
        # CRUD Mensajes
        path('agregarm/', agregarm, name="agregarm"),
        path('modificarm/<id>/', modificarm, name="modificarm"),
        path('eliminarm/<id>/', eliminarm, name="eliminarm"),
        #menumensajes
        path('menumensajes/', menumensajes, name="menumensajes"),
        #pedido
        path('checkout/', checkout, name="checkout"),
        path('registro_pedido/', nuevo_pedido, name="registro_pedido"),
        path('pedidos/', pedidos, name="pedidos"),
        path('detalle_pedido/<id>/', detalle_pedido, name="detalle_pedido"),
        path('menupedidos/', menupedidos, name="menupedidos"),
        path('actualizar_pedido/<id>', actualizar_pedido, name="actualizar_pedido"),
]
