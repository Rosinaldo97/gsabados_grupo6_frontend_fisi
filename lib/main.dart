import 'package:batery_app/screens/choose_date_screen.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'presentation',
      routes: {
        'presentation': ( _ ) => const PresentationScreen(),
        'login': ( _ ) => const LoginScreen(),
        'register': ( _ ) => const RegisterScreen(),
        'home': ( _ ) => const HomeScreen(),
        'shopping_cart': ( _ ) => const ShoppingCartScreen(),
        'profile': ( _ ) => const ProfileScreen(),
        'choose_date': ( _ ) => const ChooseDateScreen()
      },
    );
  }
}
