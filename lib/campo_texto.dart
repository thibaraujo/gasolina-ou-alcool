import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

// função para adaptar virgula
double convertToDouble(String value) {
  if (value.isEmpty) {
    return 0.0;
  }
  return double.parse(value.replaceAll(',', '.'));
}

String calculo(String gasolina, String alcool) {
  double precoGasolina = convertToDouble(gasolina);
  double precoAlcool = convertToDouble(alcool);
  double resultado = precoAlcool / precoGasolina;

  if (resultado >= 0.7) {
    return 'Gasolina';
  } else {
    return 'Álcool';
  }
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _resultado = 'Necessário informar os valores';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Gasolina ou Álcool?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  'images/car.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Preço da Gasolina',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                      controller: _controllerGasolina,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Preço do Álcool',
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20, 
                      ),
                      controller: _controllerAlcool,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton.icon(
                          onPressed: () => {
                            FocusScope.of(context).unfocus(),
                            setState(() {
                              _resultado = calculo(_controllerGasolina.text, _controllerAlcool.text);
                            })
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ), 
                          label: const Text('Calcular'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                      ),
                    ),                 
                    Padding(padding: const EdgeInsets.only(top: 90),
                      child: Text(
                        _resultado,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
