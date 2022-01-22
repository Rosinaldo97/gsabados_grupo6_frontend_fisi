import 'package:batery_app/widgets/btn_card_battery.dart';
import 'package:flutter/material.dart';

class CardBattery extends StatelessWidget {
  final String img;
  final String title;
  final double price;

  const CardBattery({
    Key? key,
    required this.img,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            children: <Widget>[
              Image.asset(
                img,
                width: width * 0.35,
              ),
              const SizedBox(height: 10),
              Text(title),
              const SizedBox(height: 5),
              Text('S/ ${price.toStringAsFixed(2)}'),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: width * 0.28,
          child: const BtnCardBattery(battery: 'Battery 1')
        )
      ],
    );
  }
}
