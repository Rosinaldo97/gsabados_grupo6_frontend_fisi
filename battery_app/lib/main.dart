import 'package:batery_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Your api key storage.
//import 'keys.dart';

// void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51KM1DoGtgvgwfOEvlnheXvjkOuAWBXOAcpG2d2xIIFVU29SkXqyy103hrsttkZRMYTRiv1GY3GKOEctY1nFIvP1B00Z5Lf2gXe";
  await Stripe.instance.applySettings();
  runApp(MyApp());
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
        'presentation': (_) => const PresentationScreen(),
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'home': (_) => const HomeScreen(),
        'shopping_cart': (_) => const ShoppingCartScreen(),
        'profile': (_) => const ProfileScreen(),
        'choose_date': (_) => const ChooseDateScreen(),
        'payment': (_) => const PaymentScreen(),
        'location': (_) => const LocationScreen(),
        'resumen': (_) => const ResumenScreen(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   // Light Theme
//   final ThemeData lightTheme = ThemeData.light().copyWith(
//     // Background color of the FloatingCard
//     cardColor: Colors.white,
//     buttonTheme: ButtonThemeData(
//       // Select here's button color
//       buttonColor: Colors.black,
//       textTheme: ButtonTextTheme.primary,
//     ),
//   );

//   // Dark Theme
//   final ThemeData darkTheme = ThemeData.dark().copyWith(
//     // Background color of the FloatingCard
//     cardColor: Colors.grey,
//     buttonTheme: ButtonThemeData(
//       // Select here's button color
//       buttonColor: Colors.yellow,
//       textTheme: ButtonTextTheme.primary,
//     ),
//   );

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Map Place Picker Demo',
//       theme: lightTheme,
//       darkTheme: darkTheme,
//       themeMode: ThemeMode.light,
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   static final kInitialPosition = LatLng(-33.8567844, 151.213108);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   PickResult selectedPlace = new PickResult();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Google Map Place Picer Demo"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 child: Text("Load Google Map"),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return PlacePicker(
//                           apiKey: 'AIzaSyCYzhlcwGo8p7zTyHbWGwKaBQ3GdzD9fVY',
//                           initialPosition: HomePage.kInitialPosition,
//                           useCurrentLocation: true,
//                           selectInitialPosition: true,
//                           //usePlaceDetailSearch: true,
//                           onPlacePicked: (result) {
//                             selectedPlace = result;
//                             Navigator.of(context).pop();
//                             setState(() {});
//                           },
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//               selectedPlace == null
//                   ? Container()
//                   : Text(selectedPlace.formattedAddress ?? ""),
//             ],
//           ),
//         ));
//   }
// }
