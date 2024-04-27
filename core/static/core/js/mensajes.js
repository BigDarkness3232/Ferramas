function eliminarProducto(id) {
    Swal.fire({
      title: '¿Está seguro de eliminar este producto?',
      text: 'Esta accion no se puede revertir',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'No, cancelar',
      confirmButtonText: 'Si, eliminar'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire('Eliminado!','Producto Eliminado Correctamente','success').then(function() {
            window.location.href = "/eliminar/"+id+"/";
        })
      }
    })
}

