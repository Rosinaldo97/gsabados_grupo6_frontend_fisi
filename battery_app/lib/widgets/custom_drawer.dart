import 'package:flutter/material.dart';
import './../widgets/globals.dart' as globals;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawer();
}

class _CustomDrawer extends State<CustomDrawer> {
  //static const String nombre = globals.nombre;
  //const String correo = globals.correo;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('${globals.nombre} ${globals.apellido}'),
            accountEmail: Text(globals.correo),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/profile.png',
                width: 35,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Inicio",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () => Navigator.pushNamed(context, 'home'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Mi Cuenta"),
            onTap: () => Navigator.pushNamed(context, 'profile'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Mi Carrito"),
            onTap: () => Navigator.pushNamed(context, 'shopping_cart'),
          ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Cerrar Sesión"),
              onTap: () => {
                    //Navigator.pushNamed(context, 'login'),
                    globals.productos.clear(),
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'login', (Route<dynamic> route) => false),
                  })
        ],
      ),
    );
  }
}
