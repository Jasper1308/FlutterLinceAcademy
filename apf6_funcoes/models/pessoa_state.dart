import 'package:flutter/material.dart';
import 'package:ap1/apf6_funcoes/models/pessoa_model.dart';

import '../controller/database.dart';

class EstadoListaDePessoas with ChangeNotifier {
  final List<Pessoa> _listaDePessoas = [];
  List<Pessoa> _pessoasExibidas =[];

  final _pessoaController = PessoaController();

  List<Pessoa> get pessoas => List.unmodifiable(_pessoasExibidas);


  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    _pessoasExibidas.add(pessoa);
    _pessoaController.salvar(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    _pessoasExibidas.remove(pessoa);
    _pessoaController.excluir(pessoa);
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

  Future<void> carregarPessoas() async {
    final pessoas = await _pessoaController.listar();
    _listaDePessoas.clear();
    _listaDePessoas.addAll(pessoas);
    _pessoasExibidas = List.from(_listaDePessoas);
    notifyListeners();
  }
// todo: implementar métodos restantes
}