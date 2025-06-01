import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_state.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_model.dart';
import 'package:ap1/apf6_funcoes/enum/tipo_sanguineo_enum.dart';

class FormularioBase extends StatefulWidget {
  final Pessoa? pessoaEditar;
  const FormularioBase({super.key, this.pessoaEditar});


  @override
  State<FormularioBase> createState() => _FormularioBaseState();
}

class _FormularioBaseState extends State<FormularioBase> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  TipoSanguineo _tipoSanguineo = TipoSanguineo.aPositivo;

  @override
  void initState() {
    super.initState();
    if (widget.pessoaEditar != null) {
      _nomeController.text = widget.pessoaEditar!.nome;
      _emailController.text = widget.pessoaEditar!.email;
      _telefoneController.text = widget.pessoaEditar!.telefone;
      _githubController.text = widget.pessoaEditar!.github;
      _tipoSanguineo = widget.pessoaEditar!.tipoSanguineo;
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final estadoListaPessoas = Provider.of<EstadoListaDePessoas>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _githubController,
              decoration: InputDecoration(
                  labelText: 'Link GitHub',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<TipoSanguineo>(
              value: _tipoSanguineo,
              hint: Text('Tipo Sanguíneo'),
              isExpanded: true,
              items: TipoSanguineo.values.map((tipo) {
                return DropdownMenuItem<TipoSanguineo>(
                  value: tipo,
                  child: Text(tipo.displayString),
                );
              }).toList(),
              onChanged: (TipoSanguineo? value) {
                setState(() {
                  _tipoSanguineo = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.pessoaEditar != null) {
                  estadoListaPessoas.editar(
                    Pessoa(
                        id: widget.pessoaEditar!.id,
                        nome: _nomeController.text,
                        email: _emailController.text,
                        telefone: _telefoneController.text,
                        github: _githubController.text,
                        tipoSanguineo: _tipoSanguineo
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pessoa atualizada com sucesso!'),
                    ),
                  );
                } else {
                  final uuid = Uuid();
                  estadoListaPessoas.incluir(
                    Pessoa(
                        id: uuid.v4(),
                        nome: _nomeController.text,
                        email: _emailController.text,
                        telefone: _telefoneController.text,
                        github: _githubController.text,
                        tipoSanguineo: _tipoSanguineo
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pessoa cadastrada com sucesso!'),
                    ),
                  );
                }
                Navigator.pop(context); // Volta para a tela anterior
              },
              child: Text(widget.pessoaEditar != null ? 'Atualizar' : 'Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
