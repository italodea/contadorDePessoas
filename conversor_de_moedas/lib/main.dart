import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = 'https://api.hgbrasil.com/finance?format=json&key00bb4207';

void main() async{

  print(await getData());

  runApp(MaterialApp(
    home: Home(

    ),
  ));
}

Future<Map> getData() async{
  http.Response response = await http.get(request);
  json.decode(response.body);
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Conversor USD BRL EUR"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        // ignore: missing_return
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:

            case ConnectionState.waiting:
              return Center(
                child: Text("Carrgando dados",
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 25.0
                ),
                  textAlign: TextAlign.center,
                )
              );
            default:
              if(snapshot.hasError){
                return Center(
                    child: Text("Erro ao carregar dados",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 25.0
                      ),
                      textAlign: TextAlign.center,
                    )
                );
              }else{
                return Container(color: Colors.blue,);
              }
          }
        }),
    );
  }
}