import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/pessoa_model.dart';
import '../enum/tipo_sanguineo_enum.dart';

Future<Database> getDatabase() async {
  final dbPath = join(
      await getDatabasesPath(),
      'pessoas.db'
  );
  return openDatabase(
    dbPath,
    version: 1,
    onCreate: (db, version) {
      db.execute(TabelaPessoas.createTable);
    },
  );
}

class TabelaPessoas {
  static const String createTable = '''
    CREATE TABLE $tableName(
      $id TEXT PRIMARY KEY NOT NULL,
      $nome TEXT NOT NULL,
      $email TEXT NOT NULL,
      $telefone TEXT NOT NULL,
      $github TEXT,
      $tipoSanguineo TEXT NOT NULL
    );
    ''';

  static const String tableName = 'pessoas';
  static const String id = 'id';
  static const String nome = 'nome';
  static const String email = 'email';
  static const String telefone = 'telefone';
  static const String github = 'github';
  static const String tipoSanguineo = 'tipo_sanguineo';

  static Map<String, dynamic> toMap(Pessoa pessoa) {
    return {
      id: pessoa.id,
      nome: pessoa.nome,
      email: pessoa.email,
      telefone: pessoa.telefone,
      github: pessoa.github,
      tipoSanguineo: pessoa.tipoSanguineo.name,
    };
  }
}

class PessoaController {
  Future<void> salvar(Pessoa pessoa) async {
    final db = await getDatabase();
    final map = TabelaPessoas.toMap(pessoa);
    await db.insert(TabelaPessoas.tableName, map);
  }

  Future<List<Pessoa>> listar() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(TabelaPessoas.tableName);
    var list = <Pessoa>[];
    for (final item in result){
      list.add(
        Pessoa(
          id: item[TabelaPessoas.id],
          nome: item[TabelaPessoas.nome],
          email: item[TabelaPessoas.email],
          telefone: item[TabelaPessoas.telefone],
          github: item[TabelaPessoas.github] ?? '',
          tipoSanguineo: TipoSanguineo.values.firstWhere(
                (element) => element.name == item[TabelaPessoas.tipoSanguineo],
          ),
        )
      );
    }
    return list;
  }

  Future<void> excluir(Pessoa pessoa) async {
    final db = await getDatabase();
    await db.delete(
      TabelaPessoas.tableName,
      where: '${TabelaPessoas.id} = ?',
      whereArgs: [pessoa.id],
    );
  }
}