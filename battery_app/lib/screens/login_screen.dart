import 'dart:convert';
import './../widgets/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  IconData passIcon = Icons.visibility_off;
  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();
  bool isPasswordVisible = false;
  var usuariosString;
  // bool logeado = false;

  Future<String> obtenerUsuarios() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-battery-app-api.cloudfunctions.net/app/api/clientes'));

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //(json.decode(response.body) as List).map((i) => {print(i['cliente_id'])});
      // print(json.decode(response.body)[0]['cliente_id']);
      // print(json.decode(response.body)[0]['nombre']);
      // print(json.decode(response.body)[0]['apellido']);
      // print(json.decode(response.body)[0]['correo']);
      //print(response.body);
      return response.body;
      //return response.body;
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }

  esperar() async {
    var resultado = await obtenerUsuarios();
    usuariosString = resultado;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    esperar();
    //usuariosString = obtenerUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: const Text(
                'Login de Usuario',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: userController,
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
            Container(
                width: double.infinity,
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                )),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: MaterialButton(
                color: const Color(0xffFC6B68),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text('Iniciar sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
                onPressed: () => {
                  if (userController.text == "" || passController.text == "")
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Rellene todos los campos')))
                  else
                    for (var i = 0; i < json.decode(usuariosString).length; i++)
                      {
                        if (userController.text ==
                                json.decode(usuariosString)[i]['correo'] &&
                            passController.text ==
                                json.decode(usuariosString)[i]['clave'])
                          {
                            //Navigator.pushNamed(context, 'home'),
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'home', (Route<dynamic> route) => false),
                            globals.isLoggedIn = true,
                            globals.cliente_id =
                                json.decode(usuariosString)[i]['cliente_id'],
                            globals.nombre =
                                json.decode(usuariosString)[i]['nombre'],
                            globals.apellido =
                                json.decode(usuariosString)[i]['apellido'],
                            globals.correo =
                                json.decode(usuariosString)[i]['correo'],
                            globals.clave =
                                json.decode(usuariosString)[i]['clave'],
                            globals.direccion =
                                json.decode(usuariosString)[i]['direccion'],
                            globals.telefono =
                                json.decode(usuariosString)[i]['telefono'],
                            print(globals.nombre)
                          }
                      },
                  if (globals.isLoggedIn == false &&
                      (userController.text != "" || passController.text != ""))
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Usuario y/o contraseña incorrectos')),
                      )
                    }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.black26,
                  width: width * 0.25,
                  height: 1.5,
                ),
                const SizedBox(width: 10),
                const Text('O continua con'),
                const SizedBox(width: 10),
                Container(
                  color: Colors.black26,
                  width: width * 0.25,
                  height: 1.5,
                )
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      color: const Color(0xff3B5998),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      color: const Color(0xffDB4437),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        'Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      color: const Color(0xff0084B4),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        'Twitter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'register'),
                  child: const Text(
                    'Registrate ahora',
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
      ),
    ));
  }
}
