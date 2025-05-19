import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class Cor {
  String nome;
  Color cor;

  Cor(this.nome, this.cor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: List(),
    );
  }
}

class List extends StatelessWidget {
  const List({super.key});

  static const cores = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  static const coresNome = [
    "Azul",
    "Vermelho",
    "Verde",
    "Amarelo",
    "Laranja"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Lista de cores'),
          )
        ),
        body: Center(
          child: ListView.builder(
            itemCount: cores.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: cores[index],
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaCor(cor: Cor(coresNome[index], cores[index])))
                        );
                      },
                      child: Text(coresNome[index])
                  ),
                )
              );
            }
          ),
        ),
      ),
    );
  }
}

class TelaCor extends StatelessWidget {
  const TelaCor({super.key, required this.cor});

  final Cor cor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
              ),
              Expanded(
                child: Center(
                  child: Text(cor.nome),
                ),
              ),
            ],
          )
        ),
        body: Container(
          color: cor.cor,
        )
        ),
      );
  }
}
