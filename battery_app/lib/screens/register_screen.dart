import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './../widgets/globals.dart' as globals;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  IconData passIcon = Icons.visibility_off;
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  bool isPasswordVisible = false;
  bool registrado = false;

  Future<bool> registrarUsuario(
      nombre, apellido, correo, clave, direccion, telefono) async {
    // final response = await http.post(Uri.parse(
    //     'https://us-central1-battery-app-api.cloudfunctions.net/app/api/clientes',body:));

    final url = Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/clientes');
    final headers = {"Content-type": "application/json"};
    // Map<String, dynamic> jsonS = {
    //   "cliente_id": "5",
    //   "nombre": "Gianfranco",
    //   "apellido": "Céspedes",
    //   "correo": "gianmcf@gmail.com",
    //   "clave": "654321",
    //   "direccion": "direccion",
    //   "telefono": "987654321",
    // };
    Map<String, dynamic> jsonS = {
      "cliente_id": (globals.clientesActuales + 1).toString(),
      "nombre": nombre,
      "apellido": apellido,
      "correo": correo,
      "clave": clave,
      "direccion": direccion,
      "telefono": telefono,
    };
    final response =
        await http.post(url, headers: headers, body: json.encode(jsonS));

    if (response.statusCode == 204) {
      // print(response.statusCode);
      globals.clientesActuales += 1;
      return true;
      //return response.body;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }

  Future<String> getNumberClientes() async {
    var url = Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/clientes');

    final response = await http.get(url);
    // globals.clientesActuales = json.decode(response.body).length();
    // print(globals.clientesActuales);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
      //return response.body;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('ERRORRRRRR');
    }
  }

  registrar(nombre, apellido, correo, clave, direccion, telefono) async {
    bool respuesta = await registrarUsuario(
        nombre, apellido, correo, clave, direccion, telefono);
    registrado = respuesta;
    Navigator.of(context).pushNamedAndRemoveUntil(
        'presentation', (Route<dynamic> route) => false);
  }

  esperar() async {
    String respuesta = await getNumberClientes();
    globals.clientesActuales = json.decode(respuesta).length;
    print(globals.clientesActuales);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    esperar();
    //registrarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //BackButton(),
                Container(
                  width: double.infinity,
                  child: const Text(
                    'Registro de Usuario',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
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
                const SizedBox(height: 20),
                TextField(
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
                const SizedBox(height: 20),
                TextField(
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Ingrese su correo',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                    suffixIcon: IconButton(
                      icon: Icon(passIcon),
                      onPressed: () {
                        if (passIcon == Icons.visibility) {
                          passIcon = Icons.visibility_off;
                          isPasswordVisible = false;
                        } else {
                          passIcon = Icons.visibility;
                          isPasswordVisible = true;
                        }
                        setState(() {});
                      },
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    hintText: 'Ingrese su teléfono',
                    prefixIcon: const Icon(Icons.local_phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    color: const Color(0xffFC6B68),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text('Registrarse',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    onPressed: () => {
                      if (nombreController.text == "" ||
                          apellidoController.text == "" ||
                          correoController.text == "" ||
                          passController.text == "" ||
                          telefonoController.text == "")
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Rellene todos los campos')),
                        )
                      else
                        registrar(
                            nombreController.text,
                            apellidoController.text,
                            correoController.text,
                            passController.text,
                            "",
                            telefonoController.text),
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '¿Ya tienes una cuenta?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'login'),
                      child: const Text(
                        'Inicia sesión ahora',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    ));
  }
}
