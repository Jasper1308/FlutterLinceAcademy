import 'package:ap1/apf6_funcoes/enum/tipo_sanguineo_enum.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pessoa_state.dart';
import '../screens/base_form.dart';

class PessoaCard extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaCard({super.key, required this.pessoa});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        title: Center(child: Text(pessoa.nome)),
        subtitle: Column(
          children: [
            Text(pessoa.email),
            Text(pessoa.telefone),
            Text(pessoa.github),
            Text(
              'Tipo ${pessoa.tipoSanguineo.displayString}',
              style: TextStyle(
                  color: pessoa.tipoSanguineo.color
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    child: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormularioBase(pessoaEditar: pessoa),
                        ),
                      );
                    }
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  child: Icon(Icons.delete,),
                  onPressed: () {
                    final estadoListaPessoas = Provider.of<EstadoListaDePessoas>(context, listen: false);
                    estadoListaPessoas.excluir(pessoa);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
