import 'package:flutter/material.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Container(
                  height: height * 0.45,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/presentation_main.png'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Column(
                  children: const <Widget>[
                    Text(
                      'Encuentra las mejores\nBaterías para tu auto',
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        fontSize: 26, 
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Explora todas las marcas y\nmodelos de baterías que tenemos para ti',
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.w600,
                        color: Color(0xffBCC5D2)
                      )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                      child: const Text(
                        'Registro',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'register'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    const SizedBox(width: 10),
                    MaterialButton(
                      color: const Color(0xffE9EBF6),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                      child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )
                      ),
                      onPressed: () => Navigator.pushNamed(context, 'login'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
              ],
            ),
          ]
        ),
      )
    );
  }
}