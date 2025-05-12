import 'dart:math';
import 'package:ap1/apf1_funcoes/ap1.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();
  int tentativas = 2;
  int resposta = 0;
  String texto = '';
  Color color = Colors.white;

  @override

  void initState() {
    super.initState();
    resposta = random.nextInt(3);
    texto = "Tentativas: $tentativas";
  }

  void testarBotao(int valor){
    if(tentativas != 0){
      if(resposta == valor){
        setState(() {
          texto = "Você acertou!";
          color = Colors.green;
        });
      }else{
        setState(() {
          tentativas--;
          texto = "Tentativas: $tentativas";
          color = Colors.red;
        });
      }
    }
  }

  void resetar(){
    setState(() {
      tentativas = 2;
      resposta = random.nextInt(3);
      texto = "Tentativas: $tentativas";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(onPressed: () {
                      testarBotao(0);
                    }, child: Text("A")),
                    ElevatedButton(onPressed: () {
                      testarBotao(1);
                    }, child: Text("B")),
                    ElevatedButton(onPressed: () {
                      testarBotao(2);
                    }, child: Text("C")),
                  ]
              ),
              ElevatedButton(onPressed: () => {resetar()}, child: Text("Resetar")),
              Text(texto),
            ],
          )

      ),
    );
  }
}


