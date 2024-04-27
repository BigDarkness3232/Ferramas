function mensajeAgregar(mensaje){
    Swal.fire({
        toast: true,
        position: 'top-end',
        icon: 'success',
        title: mensaje,
        showConfirmButton: false,
        timer: 1200
      })
}