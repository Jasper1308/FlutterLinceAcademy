import 'package:flutter/material.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_model.dart';
import 'package:uuid/uuid.dart';
import 'package:ap1/apf6_funcoes/enum/tipo_sanguineo_enum.dart';

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[
    Pessoa(
        id: const Uuid().v4(),
        nome: 'Adrian',
        email: 'adrianpjasper@gmail.com',
        telefone: '47996167347',
        github: 'github.com',
        tipoSanguineo: TipoSanguineo.oPositivo)
  ];

  List<Pessoa> _pessoasExibidas =[];

  EstadoListaDePessoas() {
    _pessoasExibidas = List.from(_listaDePessoas);
  }

  List<Pessoa> get pessoas => List.unmodifiable(_pessoasExibidas);


  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    _pessoasExibidas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    _pessoasExibidas.remove(pessoa);
    notifyListeners();
  }

  void editar(Pessoa pessoa) {
    final index = _listaDePessoas.indexWhere((p) => p.id == pessoa.id);
    _listaDePessoas[index] = pessoa;
    _pessoasExibidas[index] = pessoa;
    notifyListeners();
  }

  void buscar(String busca) {
    if(busca.isEmpty){
      _pessoasExibidas = List.from(_listaDePessoas);
    } else{
      _pessoasExibidas = _listaDePessoas.where((pessoa) {
        return pessoa.nome.toLowerCase().contains(busca.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

// todo: implementar métodos restantes
}