import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  IconData passIcon = Icons.visibility_off;
  TextEditingController passController = TextEditingController();
  bool isPasswordVisible = false;

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
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    hintText: 'Ingrese su usuario',
                    prefixIcon: const Icon(Icons.person),
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
                    onPressed: () => Navigator.pushNamed(context, 'home'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.black26,
                      width: width*0.25,
                      height: 1.5,
                    ),
                    const SizedBox(width: 10),
                    const Text('O continua con'),
                    const SizedBox(width: 10),
                    Container(
                      color: Colors.black26,
                      width: width*0.25,
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
