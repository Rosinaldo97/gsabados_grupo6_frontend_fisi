import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import './../widgets/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class ResumenScreen extends StatelessWidget {
  const ResumenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen del pedido'),
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
              const SizedBox(height: 30),
              const Text(
                'Datos del pedido',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              for (final prod in globals.productos)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          //Image.asset
                          'assets/bateria.png',
                          //prod["imagen"],
                          height: 35,
                        ),
                        const SizedBox(width: 25),
                        Text(
                          //'Batería 13 placas 87Ah V-13',
                          prod["marca"],
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 25),
                        Text(
                          //'Batería 13 placas 87Ah V-13',
                          prod["titulo"],
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 25),
                        Text(
                          'S/ ${prod["precio"]}',
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'x ${prod["cantidad"]} uni',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),

              const SizedBox(height: 20),
              Text(
                'Total: S/ ${globals.monto}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                'Estado de pago: ${globals.estado_pago}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                'Estado de entrega: No entregado',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                'Fecha de entrega: ${globals.fecha}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                'Lugar de entrega: ${globals.direccion}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
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
              const SizedBox(height: 20),
              MaterialButton(
                color: const Color(0xff07ab64),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: const Text('Ir al inicio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                onPressed: () async {
                  globals.productos.clear();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'home', (Route<dynamic> route) => false);
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
