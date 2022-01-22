import 'package:batery_app/widgets/card_battery.dart';
import 'package:batery_app/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['Todos', 'Capsa', 'Goodyear', 'Record', 'Bosch', 'Etna', 'Mac'];
  String? categorySelected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Batery App'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'shopping_cart'),
            child: Row(
              children: const <Widget>[
                Text('0', style: TextStyle(fontSize: 17),),
                SizedBox(width: 5),
                Icon(Icons.shopping_cart_sharp),
                SizedBox(width: 7),
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
                    prefixIcon: const Icon(Icons.search)
                  ),
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
                          '15', 
                          style: TextStyle(
                            fontSize: 15, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Column(  
                  children: const <Widget>[
                    CardBattery(img: 'assets/bateria.png', title: 'Batería 13 placas 87Ah V-13', price: 305),
                    SizedBox(height: 10),
                    CardBattery(img: 'assets/bateria.png', title: 'Batería 9 placas 60Ah V-6', price: 200),
                    SizedBox(height: 10),
                    CardBattery(img: 'assets/bateria.png', title: 'Batería 11 placas 90Ah V-6', price: 250),
                    SizedBox(height: 10),
                  ],
                )
              ],
            ),
          ),
        )
      )
    );
  }
}