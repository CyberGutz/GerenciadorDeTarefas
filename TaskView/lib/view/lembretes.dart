import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Classe que representa um lembrete
class Lembrete {
  String name;
  DateTime creationDate;

  // Construtor da classe
  Lembrete(this.name, {required this.creationDate});

  // Converte o lembrete para um mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'creationDate': creationDate.toIso8601String(),
    };
  }

  // Cria uma instância de Lembrete a partir de um mapa (JSON)
  factory Lembrete.fromJson(Map<String, dynamic> json) {
    return Lembrete(
      json['name'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );
  }
}

// Classe responsável por salvar e carregar os lembretes utilizando o SharedPreferences
class LembretePreferences {
  static const String _kLembreteListKey = 'lembreteList';

  // Salva a lista de lembretes no SharedPreferences
  static Future<void> saveLembretes(List<Lembrete> lembretes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> lembreteJsonList =
        lembretes.map((lembrete) => jsonEncode(lembrete.toJson())).toList();
    await prefs.setStringList(_kLembreteListKey, lembreteJsonList);
  }

  // Carrega a lista de lembretes do SharedPreferences
  static Future<List<Lembrete>> loadLembretes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? lembreteJsonList =
        prefs.getStringList(_kLembreteListKey);
    if (lembreteJsonList == null) {
      return [];
    }
    return lembreteJsonList
        .map((lembreteJson) => Lembrete.fromJson(jsonDecode(lembreteJson)))
        .toList();
  }
}

// Classe StatefulWidget que representa a tela de lembretes
class Lembretes extends StatefulWidget {
  const Lembretes({Key? key}) : super(key: key);

  @override
  _LembretesState createState() => _LembretesState();
}

class _LembretesState extends State<Lembretes> {
  List<Lembrete> lembretes = []; // Lista de lembretes

  TextEditingController _lembreteController =
      TextEditingController(); // Controlador para o campo de texto do lembrete
  String _searchQuery = ''; // Consulta de pesquisa

  @override
  void initState() {
    super.initState();
    loadLembretes(); // Carrega os lembretes ao iniciar a tela
  }

  // Carrega os lembretes do SharedPreferences
  void loadLembretes() async {
    List<Lembrete> savedLembretes = await LembretePreferences.loadLembretes();
    setState(() {
      lembretes = savedLembretes;
      lembretes.sort((a, b) => b.creationDate.compareTo(a.creationDate));
    });
  }

  // Salva os lembretes no SharedPreferences
  void saveLembretes() async {
    await LembretePreferences.saveLembretes(lembretes);
  }

  // Exibe um dialog para criar um novo lembrete
  void _showCreateLembreteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final buttonColor = isDarkMode ? Colors.white : Colors.black;

        return AlertDialog(
          title: const Text('Novo Lembrete'),
          content: TextField(
            controller: _lembreteController,
            decoration: const InputDecoration(
              hintText: 'Digite o nome do lembrete',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _lembreteController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  lembretes.add(Lembrete(
                    _lembreteController.text,
                    creationDate: DateTime.now(),
                  ));
                  lembretes
                      .sort((a, b) => b.creationDate.compareTo(a.creationDate));
                  _lembreteController.clear();
                });
                Navigator.pop(context);
                FocusScope.of(context).unfocus(); // Fechar o teclado
                saveLembretes();
              },
              child: Text(
                'Salvar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Exibe um dialog para editar um lembrete existente
  void _showEditLembreteDialog(BuildContext context, int index) {
    _lembreteController.text = lembretes[index].name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final buttonColor = isDarkMode ? Colors.white : Colors.black;

        return AlertDialog(
          title: const Text('Editar Lembrete'),
          content: TextField(
            controller: _lembreteController,
            decoration: const InputDecoration(
              hintText: 'Digite o nome do lembrete',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _lembreteController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  lembretes[index].name = _lembreteController.text;
                  _lembreteController.clear();
                });
                Navigator.pop(context);
                FocusScope.of(context).unfocus(); // Fechar o teclado
                saveLembretes();
              },
              child: Text(
                'Editar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Retorna a lista de lembretes filtrada com base na consulta de pesquisa
  List<Lembrete> getFilteredLembretes() {
    if (_searchQuery.isEmpty) {
      return lembretes;
    } else {
      return lembretes
          .where((lembrete) =>
              lembrete.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  // Retorna a data formatada com base no dia de hoje, ontem ou uma data específica
  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Hoje';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return 'Ontem';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lembretes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(113, 170, 168, 168),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(
                  color: textColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Pesquisar lembrete',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: getFilteredLembretes().length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final lembrete = getFilteredLembretes()[index];
                final formattedDate = getFormattedDate(lembrete.creationDate);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0 ||
                        lembrete.creationDate.day !=
                            getFilteredLembretes()[index - 1]
                                .creationDate
                                .day ||
                        lembrete.creationDate.month !=
                            getFilteredLembretes()[index - 1]
                                .creationDate
                                .month ||
                        lembrete.creationDate.year !=
                            getFilteredLembretes()[index - 1].creationDate.year)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          formattedDate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                    Dismissible(
                      key: Key(lembrete.name),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          setState(() {
                            lembretes.removeAt(index);
                          });
                          saveLembretes();
                        }
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                lembrete.name,
                                style: TextStyle(
                                  color: textColor,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 255, 82, 2),
                              ),
                              onPressed: () {
                                _showEditLembreteDialog(context, index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateLembreteDialog(context);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
