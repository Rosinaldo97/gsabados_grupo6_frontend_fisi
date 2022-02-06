import 'dart:convert';
import 'dart:ffi';
import 'package:batery_app/models/producto.dart';
import 'package:batery_app/widgets/card_battery.dart';
import 'package:batery_app/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import './../widgets/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Producto> productos = [];

  Future<List<Producto>> getProductos() async {
    var url = Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/productos');

    final response = await http.get(url);
    var datos = json.decode(response.body);
    var productosArr = <Producto>[];

    for (var pedido in datos) {
      productosArr.add(Producto.fromJson(pedido));
    }
    return productosArr;
  }

  Future<void> getNumberPedidos() async {
    var url = Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/pedidos');

    final response = await http.get(url);
    var datos = json.decode(response.body);
    globals.pedidosActuales = datos.length;
    print('pedidos');
    print(globals.pedidosActuales);
  }

  @override
  void initState() {
    super.initState();
    getProductos().then((value) {
      setState(() {
        productos = value;
      });
    });
    getNumberPedidos();
  }

  List<String> categories = [
    'Todos',
    'Capsa',
    'Goodyear',
    'Record',
    'Bosch',
    'Etna',
    'Mac'
  ];
  String? categorySelected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (productos.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Battery App Repartidor'),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Battery App'),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () => {
                globals.obtenerMonto(), //calcula el monto total
                Navigator.pushNamed(context, 'shopping_cart'),
              },
              child: Row(
                children: const <Widget>[
                  // Text(
                  //   '0',
                  //   style: TextStyle(fontSize: 17),
                  // ),
                  SizedBox(width: 1),
                  Icon(Icons.shopping_cart_sharp),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
        drawer: const CustomDrawer(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: 'Buscar',
                      hintText: 'Ingresar término de búsqueda',
                      prefixIcon: const Icon(Icons.search)),
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    DropdownButton(
                      hint: const Text('Todos'),
                      value: categorySelected,
                      items: categories.map((String category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          categorySelected = value.toString();
                        });
                      },
                    ),
                    const Spacer(),
                    Row(
                      children: const <Widget>[
                        Text('N° productos:'),
                        SizedBox(width: 7),
                        Text(
                          '4',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                for (final prod in productos)
                  Column(
                    children: [
                      CardBattery(
                          img: 'assets/bateria.png', //prod.linkImagen
                          title: prod.modelo,
                          price: int.parse(prod.precio),
                          idp: prod.id,
                          marca: prod.marca),
                      SizedBox(height: 15),
                    ],
                  ),
                SizedBox(height: 10),

                /*
                FutureBuilder(
                    future: _listadoProducto,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: _listGifs(snapshot.data),

                        );
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return Text("Error");
                      }
                    }
                    
                  ),
                  */

                /*
                  
                for (var i = 0; i < json.decode(productos).length; i++)
                  Column(
                    children: [
                      CardBattery(
                          img: json.decode(productos)[i]["link_imagen"],
                          title: json.decode(productos)[i]["modelo"],
                          price: json.decode(productos)[i]["precio"]),
                      SizedBox(height: 10)
                    ],
                  )


                    CardBattery(
                        img: 'assets/bateria.png',
                        title: 'Batería 13 placas 87Ah V-13',
                        price: 305),
                    SizedBox(height: 10),
                    CardBattery(
                        img: 'assets/bateria.png',
                        title: 'Batería 9 placas 60Ah V-6',
                        price: 200),
                    SizedBox(height: 10),
                    CardBattery(
                        img: 'assets/bateria.png',
                        title: 'Batería 11 placas 90Ah V-6',
                        price: 250),
                    SizedBox(height: 10),
                    */

                //)
              ],
            ),
          ),
        )));
  }

/*
  List<Widget> _listGifts(List<CardBattery> data){
    List<Widget> gifs = [];                     

    for(var gif in data){
      gifs.add(
          Image.network(gif.url),
        CardBattery( gif.img, gif.title, gif.price);
      );
    }

    return gifs;
  }
*/

}
