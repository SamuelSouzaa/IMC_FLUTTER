import 'package:flutter/material.dart';


class IMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IMCPage(),
    );
  }
}


class IMCPage extends StatefulWidget {
  @override
  _IMCPageState createState() => _IMCPageState();
}


class _IMCPageState extends State<IMCPage> {

  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  String _sexo = 'Masculino';
  String _resultado = '';

  void _calcularIMC() {

    double altura = double.tryParse(_alturaController.text) ?? 0.0;
    double peso = double.tryParse(_pesoController.text) ?? 0.0;


    if (altura > 0 && peso > 0) {
      
      altura = altura / 100;

     
      double imc = peso / (altura * altura);

      
      if (_sexo == 'Masculino') {
        if (imc < 20.7) {
          _resultado = 'Abaixo do peso';
        } else if (imc < 26.4) {
          _resultado = 'Peso normal';
        } else if (imc < 27.8) {
          _resultado = 'Marginalmente acima do peso';
        } else if (imc < 31.1) {
          _resultado = 'Acima do peso';
        } else {
          _resultado = 'Obeso';
        }
      } else {
        if (imc < 19.1) {
          _resultado = 'Abaixo do peso';
        } else if (imc < 25.8) {
          _resultado = 'Peso normal';
        } else if (imc < 27.3) {
          _resultado = 'Marginalmente acima do peso';
        } else if (imc < 32.3) {
          _resultado = 'Acima do peso';
        } else {
          _resultado = 'Obeso';
        }
      }
    } else {
      
      _resultado = 'Valores inválidos';
    }

    
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('IMC App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Nome: Samuel, RA: 1431432312002 \nKevin, RA: 1431432312023 ',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
     
              DropdownButton<String>(
                value: _sexo,
                items: ['Masculino', 'Feminino']
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
               
                  _sexo = value!;
                  setState(() {});
                },
              ),
              SizedBox(height: 16.0),
              
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              
              Text(
                _resultado,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
             
              ElevatedButton(
                onPressed: _calcularIMC,
                child: Text('Calcular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(IMCApp());
}
