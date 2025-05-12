import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(nome: "Cliques"),
    );
  }
}

class MyApp extends StatefulWidget {
  final String nome;
  const MyApp({super.key, this.nome = ""});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color cor = Colors.white;

  Color trocaCor(){
    Random random = Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed:(){
              setState(() {
                cor = trocaCor();
              });
            },
            child: Text(
              "Sortear Cor",
              style: TextStyle(
                color: cor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
