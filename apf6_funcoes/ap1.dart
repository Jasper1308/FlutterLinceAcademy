import 'package:ap1/apf6_funcoes/screens/home_screen.dart';
import 'package:ap1/apf6_funcoes/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/base_form.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_state.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => EstadoListaDePessoas(),
        child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (BuildContext context) => Home(),
        '/listagem' : (BuildContext context) => ListagemPessoas(),
        '/formulario' : (BuildContext context) => FormularioBase(),
      },
    );
  }
}

