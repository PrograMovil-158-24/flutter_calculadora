import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double primerNumero = 0;
  double segundoNumero = 0;
  double resultado = 0.0;

  void sumar() {
    setState(() {
      resultado = primerNumero + segundoNumero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Número 1',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*$')),
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) != null) {
                      primerNumero = double.parse(value);
                    }
                  }),
              const Divider(),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número 2',
                ),
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*$')),
                ],
                onChanged: (value) {
                  if (double.tryParse(value) != null) {
                    segundoNumero = double.parse(value);
                  }
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      onPressed: sumar, child: const Icon(Icons.add)),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                      onPressed: sumar, child: const Icon(Icons.minimize)),

                  // multiplicar
                  // dividir
                ],
              ),
              const Divider(),
              Text("Resultado: $resultado"),
            ])));
  }
}
//NAVEGACION