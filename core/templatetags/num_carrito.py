from django import template
from ..models import Carrito
register = template.Library()

@register.simple_tag
def cantidad_productos_carrito(request):
    cantidad = Carrito.objects.filter(id_usuario = request.user).count()
    return cantidad