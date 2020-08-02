import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controlePeso = new TextEditingController();
  int radioValor = 1;
  String _nomePlaneta = "";

  bool selecaoValor1 = true;
  bool selecaoValor2 = false;
  bool selecaoValor3;
  bool switchValor = false;

  double _resultadoFinal = 0.0;

  void calculoValorRadio(int value) {
    setState(() {
      radioValor = value;
      switch (radioValor) {
        case 0:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.06);
          _nomePlaneta =
              "Peso em Plutão é de ${_resultadoFinal.toStringAsFixed(2)} quilos";
          break;

        case 1:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.38);
          _nomePlaneta =
              "Peso em Marte é de ${_resultadoFinal.toStringAsFixed(2)} quilos";
          break;

        case 2:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.91);
          _nomePlaneta =
              "Peso em Vênus é de ${_resultadoFinal.toStringAsFixed(2)} quilos";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white70,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Sua massa na Terra",
                        hintText: "N(newtons)",
                        icon: Icon(Icons.person_outline)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValor,
                          onChanged: calculoValorRadio),
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValor,
                          onChanged: calculoValorRadio),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Radio<int>(
                          activeColor: Colors.grey,
                          value: 2,
                          groupValue: radioValor,
                          onChanged: calculoValorRadio),
                      Text(
                        "Vénus",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                    "$_nomePlaneta",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidade) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidade);
    } else {
      print("Numero errado..");
    }
  }
}
