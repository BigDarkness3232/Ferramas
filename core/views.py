from django.shortcuts import render, redirect
from .models import *
from django.core.paginator import Paginator
from django.http import Http404, HttpResponseRedirect,HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from .forms import *
from django.core.management.base import BaseCommand
from django.contrib import messages
from rest_framework import viewsets
from .serializers import *
import requests
from django.shortcuts import render
from django.contrib.auth.models import Group
from datetime import datetime
from dateutil.relativedelta import relativedelta
# Create your views here.


api_url = "http://127.0.0.1:5000"

#Creando una clase que va a permitir la transformacion



#Permisos
# FUNCION GENERICA QUE VALIDA EL GRUPO
#



def index(request):
    url = 'http://127.0.0.1:5000/Productos'
    # Obtener la lista de productos desde la API
    respuesta_productos = requests.get('http://127.0.0.1:5000/Productos')
    productos = respuesta_productos.json()

    response = requests.get(url)
    # Obtener información sobre el precio del dólar desde la API de Mindicador
    respuesta_dolar = requests.get('https://mindicador.cl/api/dolar')
    dolar_data = respuesta_dolar.json()
    precio_dolar = dolar_data['serie'][0]['valor']



        # Hacer una solicitud a la API para obtener la información del producto
 

    # Pasar la lista de productos y el precio del dólar al contexto de la plantilla
    data = {
        'listaProductos': productos,
        'precioDolar': precio_dolar,
    }
    
    return render(request, 'core/index.html', data)

def registro(request):
    data = {
        'form': CreacionUsuarioForm()
    }
    if request.method == 'POST':
        formulario = CreacionUsuarioForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
            grupo_cliente = Group.objects.get(name='cliente')
            usuario = Usuario.objects.get(username=formulario.cleaned_data['username'])
            grupo_cliente.user_set.add(usuario)
            return redirect(to="index")
        data['form'] = formulario
    return render(request, 'registration/registro.html', data)



def todosAPI(request):
    respuesta = requests.get('http://127.0.0.1:5000/Productos')
    respuesta2 = requests.get('https://mindicador.cl/api')
    productos = respuesta.json()
    monedas = respuesta2.json()
    data = {
        'listaProductos': productos,
        'moneda' : monedas,
    }
    return render(request, 'core/productos/todos_api.html', data)

#<-- Inicio Productos -->

#<-- Fin Productos -->

#Subscripción
def fundacion(request):


    return render(request, 'core/fundacion.html')


def subscripcion(request):
    json_dolar = requests.get('https://mindicador.cl/api/dolar')
    monedas = json_dolar.json()
    valor_usd = monedas['serie'][0]['valor']

    if Donacion.objects.filter(id_usuario_id = request.user.id).exists() == False:
        return redirect(to="fundacion")       
    
    monto = Donacion.objects.get(id_usuario_id = request.user.id)
    donacion_usd = round(monto.monto_a_donar/valor_usd, 2)
    data = {
        'donacion': monto,
        'donacion_usd': donacion_usd,
    }

    return render(request, 'core/subscripcion.html', data)

def agregar_sub(request):
    if Suscripcion.objects.filter(id_usuario = request.user.id).exists():
        print("hola")
        sub = Suscripcion.objects.filter(id_usuario = request.user.id).first()
        sub.suscrito_el = datetime.now().date()
        prox_mes = sub.renovacion_el + relativedelta(months=1)
        sub.renovacion_el = prox_mes
        sub.save()
        return redirect(to="perfil")
    
    prox_mes = datetime.now().date() + relativedelta(months=1)
    Suscripcion.objects.create(id_usuario_id = request.user.id, suscrito_el = datetime.now().date(), renovacion_el = prox_mes)

    return redirect(to="perfil")
#Fin cosas subs

def perfil(request):
    if Suscripcion.objects.filter(id_usuario = request.user.id).exists():
        sub = Suscripcion.objects.filter(id_usuario = request.user.id).first()
    else:
        sub = False
    data = {
        'sub': sub,
    }
    return render(request, 'core/perfil.html', data)



#Admin CRUD
def menuadmin(request):
    respuesta = requests.get('http://127.0.0.1:5000/Productos')
    producto= respuesta.json()


    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(producto, 7)
        producto = paginator.page(page)
    except:
        raise Http404

    data = {
        'listaProductos': producto,
        'paginator': paginator
    }

    return render(request, 'core/crud/menuadmin.html', data)

def agregar(request):
    data = {
        'form': ProductoForm()
    }
    if request.method == 'POST':
       formulario = ProductoForm(request.POST, files=request.FILES)
       if formulario.is_valid():
          producto_data ={
              'id': formulario.cleaned_data['id'],
              'imagen': formulario.cleaned_data['imagen'],
              'nombre_producto': formulario.cleaned_data['nombre'],
              'descripcion': formulario.cleaned_data['descripcion'],
              'id_marca': formulario.cleaned_data['id_marca'],
              'nombre_marca': formulario.cleaned_data['nombre_marca'],
              'precio': formulario.cleaned_data['precio'],
              'stock': formulario.cleaned_data['stock'],  
          }    

          response = requests.post(f"{api_url}/Productos", json=producto_data)

          if response.status_code == 200:
           messages.success(request, "producto almacenado correctamente")   
           return redirect('menuadmin')

          else:
              messages.error(request, f"error al almacenar en la base de datos : {response.text}")


    return render(request, 'core/crud/agregar.html', data)

def modificar(request, id):
    try:
        if request.method == 'POST':
            form = ProductoForm(request.POST)
            if form.is_valid():
                url = f"http://127.0.0.1:5000/Productos/{id}"
                response = requests.put(url, json=form.cleaned_data)  # Corrección aquí
                if response.status_code == 200:
                    messages.success(request, '!El producto se ha actualizado correctamente')
                    return redirect('menuadmin')
                else:
                    data = {'error': 'No se pudo actualizar el producto en la API'}
                    return render(request, 'core/crud/modificar.html', data)
            else:
                data = {'error': 'El formulario no es válido'}
                return render(request, 'core/crud/modificar.html', data)
        else:
            url = f"http://127.0.0.1:5000/Productos/{id}"
            response = requests.get(url)
            if response.status_code == 200:
                producto = response.json()
                data = {'form': ProductoForm(initial=producto), 'id': id}      
                return render(request, 'core/crud/modificar.html', data)
            else: 
                data = {'error': 'No se pudo obtener el producto de la API'}
                return render(request, 'core/crud/modificar.html', data)
    except Exception as e:
        data = {'error': str(e)}
        return render(request, 'core/crud/modificar.html', data)



def eliminar(request, id):
    try:
        url = f"http://127.0.0.1:5000/Productos/{id}"
        response = requests.delete(url)

        if response.status_code == 200:
            success_message = '!El producto se ha eliminado correctamente'
            return redirect('index')
        else:
            data = {'error': 'No se pudo eliminar el producto en la API'}
            return render(request, 'core/index.html', data)
    except Exception as e:
        data = {'error': str(e)}
        return render(request, 'core/index.html', data)





#carro

def carrito(request):
     respuesta = requests.get('https://mindicador.cl/api/dolar')
     monedas = respuesta.json()
     valor_usd = monedas['serie'][0]['valor']

     carro_compras, _ = Carrito.objects.get_or_create(usuario=request.user)
     producto = carro_compras.productos.all()
     total = carro_compras.total()


     total_dolar = round(total/valor_usd,2)


     for x in producto:
         precio_dolar = round(x.producto.precio/valor_usd,2)
         x.precio_dolar = precio_dolar

         subtotal_dolar = round(x.subtotal()/valor_usd,2)
         x.subtotal_dolar = subtotal_dolar

     data = {
        'producto': producto,
        'total': total,
        'total_dolar': total_dolar
      }
    
     return render(request, 'core/carrito.html',data)


def agregarcarrito(request, id):
    productos = Producto.objects.get(id = id)
    # Resto del código...
    carro_compra, carro_created = Carrito.objects.get_or_create(Usuario= request.user)
    carro_producto , prod_created = CarroProducto.objects.get_or_create(productos,usuario = request.user)

    if not prod_created:
        if productos.stock >= 1:
            carro_producto.cantidad +=1
            carro_producto.save()
            productos.stock -= 1
            productos.save()
            carro_compra.productos.add(carro_producto)
        else:
            return redirect(to='carrito')
    else:
        if productos.stock >= 1:
            carro_producto.cantidad = 1
            carro_producto.save()
            productos.stock -= 1
            productos.save()
            carro_compra.productos.add(carro_producto)
        else:
            return redirect(to='carrito')
    carro_compra.save()
    
    return redirect(to='carrito')

def borrarcarrito(request, id):
    producto = Producto.objects.get(id = id)
    carro_compras = Carrito.objects.get(usuario = request.user)
    carro_producto = carro_compras.productos.get(producto = producto)


    carro_compras.productos.remove(carro_producto)
    carro_producto.delete()


    producto.stock += carro_producto.cantidad
    producto.save()
    return redirect(to = 'carrito')

def bajarstock(request, id):
    producto = Producto.objects.get(id = id)
    carro_compras = carrito.objects.get(usuario = request.user)
    carro_producto = carro_compras.productos.get(producto = producto)  

    if carro_producto.cantidad > 1:
        carro_producto.cantidad-= 1
        carro_producto.save()
        carro_compras.delete()
    else:
        carro_compras.productos.remove(carro_producto)
        carro_producto.delete()

    Producto.stock +=1
    Producto.save()
 
    return redirect(to = 'carrito') 


#orden

def checkout(request):
    respuesta2 = requests.get('https://mindicador.cl/api/dolar')
    monedas = respuesta2.json()
    productos = Carrito.objects.get(usuario = request.user)

    if Suscripcion.objects.filter(usuario = request.user.id).exists():
        sub = Suscripcion.objects.filter(usuario = request.user.id).first()
        esta_suscrito = sub.estado_sub
    else:
        esta_suscrito = False
    
    precio_clp = 0
    for producto in productos:
        precio_clp = precio_clp + producto.subtotal_producto
    
    descuento = round(precio_clp * 0.95)

    valor_usd = monedas['serie'][0]['valor']
    if esta_suscrito == True:
        precio_usd = descuento/valor_usd
    else:
        precio_usd = precio_clp/valor_usd

    data = {
        'listaProductos': productos,
        'valor' : round(precio_usd, 2),
        'precio_clp': precio_clp,
        'descuento' : descuento,
        'is_sub' : esta_suscrito,
        'valor_dolar': valor_usd,
    }
    
    return render(request, 'core/checkout.html', data)


def nuevo_pedido(request):
    #carrito y todo lo que contiene del usuario
    productos_carrito = Carrito.objects.filter(id_usuario = request.user.id).all()
    #nueva orden
    estado1 = EstadoOrden.objects.filter(id = 1).first()
    orden = Orden.objects.create(id_usuario = request.user, estado_orden = estado1, creado_en = datetime.now().date(), modificado_en = datetime.now().date(), direccion_envio=request.user.direccion)
    #falta precio
    total = 0
    for producto in productos_carrito:
        detalle_orden = OrdenProducto.objects.create(orden = orden, producto = producto.producto_carrito, cantidad_prod = producto.cantidad_prod)
        total = total +  producto.subtotal_producto
    
    if Suscripcion.objects.filter(id_usuario = request.user.id).exists():
        sub = Suscripcion.objects.filter(id_usuario = request.user.id).first()
        esta_suscrito = sub.estado_sub
    else:
        esta_suscrito = False
    
    if esta_suscrito:
        total = total * 0.95
        orden.descuento_sub = 1
    else:
        orden.descuento_sub = 0

    orden.precio_orden = total

    orden.save()
    detalle_orden.save()
    #Lets goooooooooo
    #Despues de creada la orden, se borra el carrito de compras
    productos_carrito.delete()
    return redirect(to="pedidos")


def pedidos(request):

    ordenes = Orden.objects.filter(id_usuario = request.user.id).all()
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(ordenes, 5)
        ordenes = paginator.page(page)
    except:
        raise Http404

    data = {
        'listaPedidos': ordenes,
        'paginator': paginator
    }

    return render(request, 'core/pedidos.html', data)


def detalle_pedido(request, id):
    
    orden = Orden.objects.get(id = id)
    detalle_orden = OrdenProducto.objects.filter(orden = id).all()
    sin_descuento = round(orden.precio_orden / 0.95)
    data = {
        'orden': orden,
        'detalle': detalle_orden,
        'sin_descuento': sin_descuento
    }
    return render(request, 'core/detalle_pedido.html', data)

def menupedidos(request):
    pedidos = Orden.objects.all()
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(pedidos, 7)
        pedidos = paginator.page(page)
    except:
        raise Http404

    data = {
        'listaPedidos': pedidos,
        'paginator': paginator,
        'form': EstadoOdenForm
    }
    print(data['listaPedidos'])
    return render(request, 'core/crud/menupedidos.html', data)

def actualizar_pedido(request, id):
    pedido = Orden.objects.get(id=id); 
    data = {
        'aux': pedido,
        'form': EstadoOdenForm(instance=pedido) # LA INFO SE ALMACENA EN EL FORMULARIO
    }
    if request.method == 'POST':
        formulario = EstadoOdenForm(data=request.POST, instance=pedido)
        if formulario.is_valid():
            pedido.modificado_en = datetime.now().date()
            pedido.save()
            formulario.save()
            messages.success(request, "Orden actualizado correctamente")
            data['form'] = formulario # CARGAMOS EL FORMULARIO FINAL CON LA INFO MODIFICADA

    return render(request, 'core/crud/actualizar_pedido.html', data)

def informes(request):
    pedidos = Orden.objects.all()

    data = {

        'listaPedidos': pedidos

    }
    print(data['listaPedidos'])
    return render(request, 'core/informes.html', data)

