import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulário Básico'),
        ),
        body: _Form(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  String _nome = '';
  int _idade = 0;
  bool _ativo = false;
  Pessoa? _pessoaSalva;

  final _formKey = GlobalKey<FormState>();

  void _enviarForm(String nome, int idade, bool ativo){
    setState(() {
      _pessoaSalva = Pessoa(nome, idade, ativo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator:  (value) {
                    if (value == null || value.isEmpty) return "Preencha o campo nome!";
                    if (value.length < 3) return "Nome muito curto!";
                    if (value.startsWith(RegExp(r'[^A-Z]'))) return "Nome deve começar com letra maiúscula!";
                  },
                  onChanged: (value) => setState(() {
                    _nome = value;
                  }),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Preencha o campo idade!";
                    if (int.parse(value) < 18) return "Você é menor de idade!";
                  },
                  onChanged: (value) => setState(() {
                    _idade = int.parse(value);
                  }),
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    hintText: 'Digite sua idade',
                  ),
                ),
                Checkbox(
                  value: _ativo,
                  onChanged: (value) => setState(() {
                    _ativo = value as bool;
                  }),
                ),
                Padding(padding: EdgeInsets.all(16)),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      _enviarForm(_nome, _idade, _ativo);
                    }
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(16),
          child: _Salvos(pessoa: _pessoaSalva,),
        )
      ],
    );
  }
}

class _Salvos extends StatelessWidget {
  const _Salvos({super.key, this.pessoa});

  final Pessoa? pessoa;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pessoa?.ativo == true ? Colors.green : Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(32),
        child: pessoa != null ? Text(pessoa.toString()) : Text("Nenhuma pessoa salva"),
      ),
    );
  }
}

class Pessoa {
  String nome;
  int idade;
  bool ativo;

  Pessoa(this.nome, this.idade, this.ativo);

  @override
  String toString() {
    return 'nome: $nome, idade: $idade';
  }
}