import 'package:batery_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import './../widgets/globals.dart' as globals;

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  /*var mont;
  @override
  void initState() {
    super.initState();
    globals.obtenerMonto();
    mont = globals.monto;
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi Carrito'),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (globals.productos.length != 0)
                const Text('Resumen de compra',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              if (globals.productos.length == 0)
                Text("Carrito sin productos, elige productos para comprar.")
              else
                for (final prod in globals.productos)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Container(
                          //   padding: const EdgeInsets.all(5),
                          //   //child: const Icon(Icons.delete_forever_outlined),
                          //   decoration: BoxDecoration(
                          //       color: Colors.redAccent,
                          //       borderRadius: BorderRadius.circular(5)),
                          // ),
                          //const SizedBox(width: 10),
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
              const SizedBox(
                height: 10,
              ),
              if (globals.productos.length != 0)
                Container(
                    width: double.infinity,
                    child: Text(
                      'Total: S/ ' + globals.monto,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              const SizedBox(
                height: 15,
              ),
              if (globals.productos.length != 0)
                Container(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, 'choose_date'),
                      child: const Text('Continuar'),
                      color: const Color(0xffF5C20A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
