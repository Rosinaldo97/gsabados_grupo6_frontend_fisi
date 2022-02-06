library my_prj.globals;

//Para saber si el cliente está logeado
bool isLoggedIn = false;
int clientesActuales = 0;
int pedidosActuales = 0;

//Datos del cliente
String cliente_id = "";
String nombre = "";
String apellido = "";
String correo = "";
String clave = "";
String direccion = "";
String telefono = "";

//Datos del pedido. Para el carrito
String repartidor_id = ""; //Interfaz del repartidor
String monto = "30"; //Dólares
String estado_entrega = "No entregado";
String estado_pago = "Pagado";
String fecha = "";
List<Map<String, dynamic>> productos = [];

void obtenerMonto() {
  int total = 0;
  for (var producto in productos) {
    total += int.parse(producto['precio']) * int.parse(producto['cantidad']);
  }
  monto = total.toString();
  print(monto);
}

/*
  Para agregar un elemento a la lista:
      globals.productos.add({
        "producto_id": "1",
        "cantidad": "5"
      });
  
  Para borrar todos los elementos de una lista:
      globals.productos.clean();




*/
