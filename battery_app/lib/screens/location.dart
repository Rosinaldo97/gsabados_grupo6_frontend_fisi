import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import './../widgets/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LocationScreen> {
  PickResult selectedPlace = new PickResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Elegir lugar de la entrega"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/ubicacion.png'),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text("Establecer ubicación"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlacePicker(
                          apiKey: 'api',
                          initialPosition: LocationScreen.kInitialPosition,
                          useCurrentLocation: true,
                          selectInitialPosition: true,
                          //usePlaceDetailSearch: true,
                          onPlacePicked: (result) {
                            selectedPlace = result;
                            globals.direccion =
                                selectedPlace.formattedAddress.toString();
                            print(globals.direccion);
                            Navigator.pushNamed(context, 'payment');
                            setState(() {});
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              selectedPlace == null
                  ? Container()
                  : Text(selectedPlace.formattedAddress ?? ""),
            ],
          ),
        ));
  }
}

// class LocationScreen extends StatelessWidget {
//   const LocationScreen({Key? key}) : super(key: key);

//   static final kInitialPosition = LatLng(-33.8567844, 151.213108);
//   PickResult selectedPlace = new PickResult();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Indicar ubicación'),
//         centerTitle: true,
//         elevation: 3,
//       ),
//       body: Container(
//           color: Colors.white,
//           width: double.infinity,
//           height: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset('assets/pagos.png'),
//               const Text(
//                 'Indique su ubicación a donde desea que se le haga la entrega.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xffBCC5D2)),
//               ),
//               const SizedBox(height: 20),
//               // Container(
//               //   width: double.infinity,
//               //   child: MaterialButton(
//               //     color: const Color(0xffFC6B68),
//               //     padding: const EdgeInsets.symmetric(vertical: 15),
//               //     child: const Text('Escoger fecha',
//               //         style: TextStyle(
//               //           color: Colors.white,
//               //           fontSize: 16,
//               //         )),
//               //     onPressed: () => _selectDate(context),
//               //     shape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(15)),
//               //   ),
//               // ),
//               const SizedBox(height: 20),
//               MaterialButton(
//                 color: const Color(0xff07ab64),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                 child: const Text('Establecer ubicación',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     )),
//                 onPressed: () async {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return PlacePicker(
//                           apiKey: 'AIzaSyCYzhlcwGo8p7zTyHbWGwKaBQ3GdzD9fVY',
//                           initialPosition: kInitialPosition,
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
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//               ),
//               const SizedBox(height: 50),
//             ],
//           )

//           // width: double.infinity,
//           // child: Column(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: [

//           //   ],
//           // ),
//           ),
//     );
//   }
// }
