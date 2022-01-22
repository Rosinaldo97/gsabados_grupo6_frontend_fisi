import 'package:flutter/material.dart';

class BtnCardBattery extends StatefulWidget {
  final String battery;

  const BtnCardBattery({
    Key? key,
    required this.battery,
  }) : super(key: key);

  @override
  _BtnCardBatteryState createState() => _BtnCardBatteryState();
}

class _BtnCardBatteryState extends State<BtnCardBattery> {
  int numberBatteries = 0;
  String textAddChart = 'Agregar al carrito';

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
              textAddChart = (textAddChart == 'Agregar al carrito')
                ? 'Quitar del carrito'
                  : 'Agregar al carrito';
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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      numberBatteries = (numberBatteries > 0)
                        ? numberBatteries - 1
                          : 0;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
