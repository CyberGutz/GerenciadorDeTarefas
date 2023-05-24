import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _nomeDoBanco = "banco_gerenciador_de_tarefas.db";
  static final _versaoDoBanco = 1;

  // Defina as tabelas e colunas aqui

  DatabaseHelper._construtorPrivado();
  static final DatabaseHelper instancia = DatabaseHelper._construtorPrivado();

  static Database? _bancoDeDados;

  Future<Database> get bancoDeDados async {
    if (_bancoDeDados != null) return _bancoDeDados!;
    _bancoDeDados = await _inicializarBancoDeDados();
    return _bancoDeDados!;
  }

  Future<Database> _inicializarBancoDeDados() async {
    String caminho = join(await getDatabasesPath(), _nomeDoBanco);
    return await openDatabase(
      caminho,
      version: _versaoDoBanco,
      onCreate: _criarTabelas,
    );
  }

  Future<void> _criarTabelas(Database db, int versao) async {
    // Crie as tabelas usando db.execute()
    // Exemplo:
    // await db.execute('''
    //   CREATE TABLE minha_tabela (
    //     id INTEGER PRIMARY KEY,
    //     nome TEXT,
    //     idade INTEGER
    //   )
    // ''');
  }

  // Implemente as funções para manipulação do banco de dados, como inserir, atualizar, excluir e consultar registros.
}
