import 'package:ap1/apf6_funcoes/components/pessoa_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_state.dart';


class ListagemPessoas extends StatefulWidget {
  const ListagemPessoas({super.key});

  @override
  State<ListagemPessoas> createState() => _ListagemPessoasState();
}

class _ListagemPessoasState extends State<ListagemPessoas> {
  late final TextEditingController _buscaController;

  @override
  void initState() {
    super.initState();
    _buscaController = TextEditingController();
    final estadoListaPessoas = Provider.of<EstadoListaDePessoas>(context, listen: false);
    estadoListaPessoas.carregarPessoas();
  }

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Listagem de Pessoas')),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _buscaController,
                onChanged: (value) {
                  final estadoListaPessoas = Provider.of<EstadoListaDePessoas>(context, listen: false);
                  estadoListaPessoas.buscar(value);
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Digite sua pesquisa',
                    labelText: 'Filtrar por nome',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
            ),
            Expanded(
              child: Consumer<EstadoListaDePessoas>(
                  builder: (context, estado, child) {
                    final pessoas = estado.pessoas;

                    if(pessoas.isEmpty) {
                      return Center(
                        child: Text('Nenhuma pessoa cadastrada!'),
                      );
                    }

                    return ListView.builder(
                      itemCount: pessoas.length,
                      itemBuilder: (BuildContext context, int i) => PessoaCard(pessoa: pessoas[i])
                    );
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pushNamed(context, '/formulario'),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}