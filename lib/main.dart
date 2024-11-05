import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _valor1Controller = TextEditingController();
  TextEditingController _valor2Controller = TextEditingController();
  String _resultado = '';
  String _texto = "";
  _somarValores() {
    double valor1 = double.parse(_valor1Controller.text); //Altura
    double valor2 = double.parse(_valor2Controller.text); //Peso
    setState(() {
      double resultado = valor2 / (valor1 * valor1);
      _resultado = "Resultado:${resultado}";

      if (resultado < 18.5) {
        _texto = "*Abaixo do Peso*";
      } else if (resultado >= 18.5 && resultado < 24.9) {
        _texto = "*Peso Normal*";
      } else if (resultado >= 25.0 && resultado < 29.9) {
        _texto = "*Excesso de Peso*";
      } else if  (resultado >= 30.0 && resultado < 34.9) {
        _texto = "*Obesidade Classe I*";
      } else if (resultado >= 35.0 && resultado < 39.9) {
        _texto = "*Obesidade Classe II*";
      } else {
        _texto = "*Obesidade Classe III*";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Calculadora IMC (Índice de Massa Corpórea)",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.sports_gymnastics_outlined,
              color: Colors.black,
              size: 40.0,
            ),
            TextField(
              controller: _valor1Controller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: "Digite sua Altura:",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            TextField(
              controller: _valor2Controller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: "Digite seu Peso:",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _somarValores,
              child: const Text(
                "Calcular",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            Text(
              _resultado,
              style: const TextStyle(
                color: Color.fromARGB(219, 2, 2, 0),
                fontSize: 23,
              ),
            ),
            Text(
              _texto,
              style: const TextStyle(
                color: Color.fromARGB(219, 2, 2, 0),
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
