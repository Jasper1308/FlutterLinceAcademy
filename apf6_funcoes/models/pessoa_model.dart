import 'package:equatable/equatable.dart';
import 'package:ap1/apf6_funcoes/enum/tipo_sanguineo_enum.dart';

class Pessoa extends Equatable{
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  const Pessoa({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  @override
  List<Object> get props => [id, nome, email, telefone, github, tipoSanguineo];
}