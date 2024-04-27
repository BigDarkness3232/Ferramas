from django import template
register = template.Library()

@register.simple_tag
def es_vendedor(request):
    return request.user.groups.filter(name="vendedor").exists()
