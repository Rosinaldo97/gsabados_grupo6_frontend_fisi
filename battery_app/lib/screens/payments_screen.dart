import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import './../widgets/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as development;
import 'dart:math' as math;

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  Future<bool> registrarProducto() async {
    final url = Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/pedidos');
    final headers = {"Content-type": "application/json"};
    // Map<String, dynamic> jsonS = {
    //   "cliente_id": "5",
    //   "nombre": "Gianfranco",
    //   "apellido": "Céspedes",
    //   "correo": "gianmcf@gmail.com",
    //   "clave": "654321",
    //   "direccion": "direccion",
    //   "telefono": "987654321",
    // };
    Map<String, dynamic> jsonS = {
      "pedido_id": (globals.pedidosActuales + 1).toString(),
      "fecha": globals.fecha,
      "monto": globals.monto,
      "cliente_id": globals.cliente_id,
      "estado_pago": globals.estado_pago,
      "estado_entrega": globals.estado_entrega,
      "repartidor_id": globals.repartidor_id,
      "productos": globals.productos
    };
    final response =
        await http.post(url, headers: headers, body: json.encode(jsonS));

    if (response.statusCode == 204) {
      // print(response.statusCode);
      globals.clientesActuales += 1;
      return true;
      //return response.body;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }

  Future<void> actualizarDireccion() async {
    final url = Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/clientes/${globals.cliente_id}');
    final headers = {"Content-type": "application/json"};
    // Map<String, dynamic> jsonS = {
    //   "cliente_id": "5",
    //   "nombre": "Gianfranco",
    //   "apellido": "Céspedes",
    //   "correo": "gianmcf@gmail.com",
    //   "clave": "654321",
    //   "direccion": "direccion",
    //   "telefono": "987654321",
    // };
    Map<String, dynamic> jsonS = {
      "cliente_id": globals.cliente_id,
      "nombre": globals.nombre,
      "apellido": globals.apellido,
      "correo": globals.correo,
      "clave": globals.clave,
      "direccion": globals.direccion,
      "telefono": globals.telefono,
    };
    final response =
        await http.put(url, headers: headers, body: json.encode(jsonS));

    if (response.statusCode == 204) {
      // print(response.statusCode);
      print("Dirección actualizada");
      //return response.body;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> initPaymentSheet(context,
        {required String email, required int amount}) async {
      try {
        // 1. create payment intent on the server
        final response = await http.post(
            Uri.parse(
                'https://us-central1-battery-app-api.cloudfunctions.net/stripePaymentIntentRequest'),
            body: {
              'email': email,
              'amount': amount.toString(),
            });

        final jsonResponse = jsonDecode(response.body);
        //log(jsonResponse.toString());

        //2. initialize the payment sheet
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: jsonResponse['paymentIntent'],
            merchantDisplayName: 'Battery App',
            customerId: jsonResponse['customer'],
            customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
            style: ThemeMode.light,
            testEnv: true,
            merchantCountryCode: 'soles',
          ),
        );

        await Stripe.instance.presentPaymentSheet();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pago completado!')),
        );

        globals.estado_pago = "Pagado";
        print(globals.estado_pago);
        registrarProducto();
        actualizarDireccion();
        Navigator.of(context).pushNamedAndRemoveUntil(
            'resumen', (Route<dynamic> route) => false);
      } catch (e) {
        if (e is StripeException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Pago cancelado'),
              //content: Text('Error from Stripe: ${e.error.localizedMessage}'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegir método de pago'),
        centerTitle: true,
        elevation: 3,
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/pagos.png'),
              const Text(
                'Recuerde que ambos métodos de pago incluyen instalación completamente gratis.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffBCC5D2)),
              ),
              const SizedBox(height: 20),
              // Container(
              //   width: double.infinity,
              //   child: MaterialButton(
              //     color: const Color(0xffFC6B68),
              //     padding: const EdgeInsets.symmetric(vertical: 15),
              //     child: const Text('Escoger fecha',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 16,
              //         )),
              //     onPressed: () => _selectDate(context),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //   ),
              // ),
              const SizedBox(height: 20),
              MaterialButton(
                color: const Color(0xff07ab64),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: const Text('Pago con tarjeta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                onPressed: () async {
                  await initPaymentSheet(context,
                      email: (globals.correo).toString(),
                      amount: (double.parse((globals.monto)) * 100)
                          .round()); //Email del usuario y el monto del carrito
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              const SizedBox(height: 50),
              MaterialButton(
                color: const Color(0xff07ab64),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: const Text('Pago contraentrega',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                onPressed: () {
                  registrarProducto();
                  actualizarDireccion();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'resumen', (Route<dynamic> route) => false);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              )
            ],
          )

          // width: double.infinity,
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [

          //   ],
          // ),
          ),
    );
  }
}
