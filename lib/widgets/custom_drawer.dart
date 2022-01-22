import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("EddieHs06"),
            accountEmail: Text("ejhuancahuire@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("EH"),
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
            onTap: () => Navigator.pushNamed(context, 'login'),
          )
        ],
      ),
    );
  }
}
