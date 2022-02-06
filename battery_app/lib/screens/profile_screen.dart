import 'package:batery_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import './../widgets/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  String textBtn = 'Actualizar datos';
  bool isEnabled = false;

  @override
  void initState() {
    setState(() {
      nombreController.text = globals.nombre;
      apellidoController.text = globals.apellido;
      correoController.text = globals.correo;
      passController.text = globals.clave;
      telefonoController.text = globals.telefono;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Cuenta'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'shopping_cart'),
            child: Row(
              children: const <Widget>[
                Icon(Icons.shopping_cart_sharp),
                SizedBox(width: 7),
              ],
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'http://assets.stickpng.com/images/585e4beacb11b227491c3399.png'),
            ),
            const SizedBox(height: 15),
            TextField(
              enabled: isEnabled,
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingrese su nombre',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              enabled: isEnabled,
              controller: apellidoController,
              decoration: InputDecoration(
                labelText: 'Apellido',
                hintText: 'Ingrese su apellido',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              enabled: isEnabled,
              controller: correoController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Ingrese su email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              enabled: isEnabled,
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              enabled: isEnabled,
              controller: telefonoController,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                hintText: 'Ingrese su teléfono',
                prefixIcon: const Icon(Icons.local_phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 17),
            Container(
              width: double.infinity,
              child: MaterialButton(
                color: const Color(0xffFC6B68),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(textBtn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                onPressed: () {
                  setState(() {
                    if (textBtn == 'Actualizar datos') {
                      isEnabled = true;
                      textBtn = 'Guardar cambios';
                    } else {
                      isEnabled = false;
                      textBtn = 'Actualizar datos';
                    }
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
