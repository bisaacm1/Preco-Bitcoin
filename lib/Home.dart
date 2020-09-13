import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerPreco = TextEditingController();
  String _resultado = "0";

  _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _resultado = retorno['BRL']['buy'].toString();
    });

    // print(
    //   "Resposta logradouro: ${logradouro} bairro: ${bairro} ");

    //print("resposta: " + response.statusCode.toString() );
    //print("resposta: " + response.body );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset('images/bitcoin.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'R\$' + _resultado,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _recuperarPreco),
            ),
          ],
        ),
      ),
    );
  }
}
