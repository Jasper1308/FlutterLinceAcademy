import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CRUD')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/listagem'),
                child: Text('Ver Pessoas')
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/formulario'),
              child: Text('Incluir Pessoa'),
            ),
          ],
        ),
      ),
    );
  }
}