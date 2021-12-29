import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String str = "";
  getJsonData() async {
    //comunicação sincrona e assyncrona
    print("Entrei na funçao");
    var uri = Uri.parse("http://192.168.15.9;8080");

    http.Response response;

    response = await http.get(uri);
    print("Codigo de retorno: " + response.statusCode.toString());
    print("Corpo de resposta: " + response.body);

    //decodifica o json
    Map<String, dynamic> retorno = json.decode(response.body);
    print("mensagem : + ${retorno["message"]}");
    str = retorno["message"];
    setState(() {

    });
  }

  String valor = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("consumindo API"),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Obtendo valor de um servidor rest"),
                ElevatedButton(
                    onPressed: () {
                      print("chamando a função");
                      getJsonData();
                    },
                    child: Text("Clique aqui")),
                Text(valor),
              ],
            )));
  }
}
