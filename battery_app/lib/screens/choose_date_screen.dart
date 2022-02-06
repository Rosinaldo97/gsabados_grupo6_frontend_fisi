import './../widgets/globals.dart' as globals;
import 'package:flutter/material.dart';

class ChooseDateScreen extends StatefulWidget {
  const ChooseDateScreen({Key? key}) : super(key: key);

  @override
  _ChooseDateScreenState createState() => _ChooseDateScreenState();
}

class _ChooseDateScreenState extends State<ChooseDateScreen> {
  DateTime? _selectedDate = null;

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      helpText: 'Seleccionar fecha de entrega',
      cancelText: 'Cancelar',
      confirmText: 'Seleccionar',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = selected;
        globals.fecha =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
        print(globals.fecha);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Escoger fecha de entrega'),
          centerTitle: true,
          elevation: 3,
        ),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/date_picker.png'),
                const Text(
                  'Recuerda que los horarios de recojo son:\n\nLunes-Viernes 08:00-18:00 hrs\nSábado-Domingo 08:00-13:00 hrs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffBCC5D2)),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    color: const Color(0xffFC6B68),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text('Escoger fecha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    onPressed: () => _selectDate(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(height: 20),
                if (_selectedDate != null)
                  Column(
                    children: [
                      Text(
                        'Fecha seleccionada: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      MaterialButton(
                        color: const Color(0xff07ab64),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        child: const Text('Continuar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, 'location');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ],
                  ),
              ],
            )));
  }
}
