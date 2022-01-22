import 'package:batery_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
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
            const Text(
              'Resumen de compra',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.delete_forever_outlined),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/bateria.png', height: 35,),
                const SizedBox(width: 5),
                const Text('Batería 13 placas 87Ah V-13', style: TextStyle(fontSize: 13),),
                const SizedBox(width: 10),
                const Text('S/ 480.50', style: TextStyle(fontSize: 13),)
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.delete_forever_outlined),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/bateria.png', height: 35,),
                const SizedBox(width: 5),
                const Text('Batería 13 placas 87Ah V-13', style: TextStyle(fontSize: 13),),
                const SizedBox(width: 10),
                const Text('S/ 480.50', style: TextStyle(fontSize: 13),)
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.delete_forever_outlined),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/bateria.png', height: 35,),
                const SizedBox(width: 5),
                const Text('Batería 13 placas 87Ah V-13', style: TextStyle(fontSize: 13),),
                const SizedBox(width: 10),
                const Text('S/ 480.50', style: TextStyle(fontSize: 13),)
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.delete_forever_outlined),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/bateria.png', height: 35,),
                const SizedBox(width: 5),
                const Text('Batería 13 placas 87Ah V-13', style: TextStyle(fontSize: 13),),
                const SizedBox(width: 10),
                const Text('S/ 480.50', style: TextStyle(fontSize: 13),)
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: const Text(
                'Subtotal: S/ 790.30', 
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: const Text(
                'IGV: S/ 120.10', 
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: const Text(
                'Total: S/ 925.00', 
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            const SizedBox(height: 15,),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () => Navigator.pushNamed(context, 'choose_date'),
                child: const Text('Continuar'),
                color: const Color(0xffF5C20A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              )
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                child: const Text('Vaciar carrito', style: TextStyle(color: Colors.white),),
                color: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}