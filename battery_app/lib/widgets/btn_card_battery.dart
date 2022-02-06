import 'package:flutter/material.dart';
import './../widgets/globals.dart' as globals;

String id = "";

class BtnCardBattery extends StatefulWidget {
  final String battery;

///////
  final String img;
  final String title;
  final int price;
  final String marca;
//////

  const BtnCardBattery(
      {Key? key,
      required this.battery,
      required this.img,
      required this.title,
      required this.price,
      required this.marca})
      : super(key: key);

  @override
  _BtnCardBatteryState createState() => _BtnCardBatteryState();
}

class _BtnCardBatteryState extends State<BtnCardBattery> {
  int numberBatteries = 0;
  String producto_Id = "";
  String image = "";
  String titul = "";
  int preci = 0;
  String marca = "";
  String textAddChart = 'Agregar al carrito';

  @override
  void initState() {
    super.initState();
    producto_Id = widget.battery;
    image = widget.img;
    titul = widget.title;
    preci = widget.price;
    marca = widget.marca;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: Text(
            textAddChart,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12.4),
            maxLines: 2,
          ),
          color: const Color(0xffF5C20A),
          onPressed: () {
            setState(() {
              if (numberBatteries != 0) if (textAddChart ==
                  'Agregar al carrito') {
                textAddChart = 'Quitar del carrito';
                globals.productos.add({
                  "producto_id": producto_Id,
                  "cantidad": numberBatteries.toString(),
                  "imagen": image,
                  "precio": preci.toString(),
                  "titulo": titul,
                  "marca": marca,
                });
                print(globals.productos);
              } else {
                if (textAddChart == 'Quitar del carrito') {
                  numberBatteries = 0;
                  textAddChart = 'Agregar al carrito';
                  globals.productos.removeWhere(
                      (producto) => producto["producto_id"] == producto_Id);
                  print(globals.productos);
                }
              }
            });
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                child: Text(
                  '$numberBatteries',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(196, 196, 196, 0.9),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            const SizedBox(width: 5),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numberBatteries =
                          (numberBatteries > 0) ? numberBatteries - 1 : 0;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: const Text(
                      '-',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numberBatteries = numberBatteries + 1;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: const Text(
                      '+',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
