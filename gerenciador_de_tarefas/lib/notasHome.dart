import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'nota.dart';
import 'notaPage.dart';
import 'nota_preference.dart';

class NotasHome extends StatefulWidget {
  const NotasHome({super.key});

  @override
  _NotasHomeState createState() => _NotasHomeState();
}

class _NotasHomeState extends State<NotasHome> {
  List<Nota> notas = [];
  List<Nota> selectedList = [];

  final TextEditingController _notaController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    selectedList.clear();
    loadnotas(); // Carrega as tarefas ao inicializar o widget
  }

  // Carrega as tarefas do SharedPreferences
  void loadnotas() async {
    List<Nota> notasSalvas = await NotaPreferences.loadNotas();
    setState(() {
      notas = notasSalvas.reversed.toList(); // Inverte a lista de notas
    });
  }

  // Salva as tarefas no SharedPreferences
  void savenotas() async {
    await NotaPreferences.saveNotas(notas);
  }

  void _showCreateNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final buttonColor = isDarkMode ? Colors.white : Colors.black;

        return AlertDialog(
          title: const Text('Nova Nota'),
          content: TextField(
            controller: _notaController,
            decoration: const InputDecoration(
              hintText: 'Digite o nome da Nota',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _notaController.clear();
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
                  notas.insert(
                    0, // Insere a nova tarefa no início da lista
                    Nota(
                      _notaController.text,
                      conteudo: "",
                      dataCriado: DateTime.now(),
                      dataLastEdited: DateTime.now(),
                    ),
                  );
                  _notaController.clear();
                });
                Navigator.pop(context);
                FocusScope.of(context).unfocus(); // Fecha o teclado
                savenotas();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 150,
                mainAxisExtent: 175,
                mainAxisSpacing: 10),
            itemCount: notas.length,
            itemBuilder: (context, index) {
              return gridTile(index);
            },
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateNoteDialog(context),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          foregroundColor: Theme.of(context).colorScheme.onTertiary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.note_add,
            size: 30,
          ),
        ));
  }

  void pusharPag(List<Nota> notas, int index, BuildContext context) async {
    notas[index].dataLastEdited = DateTime.now();
    String conteudo = notas[index].conteudo;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NotaPage(notas[index].titulo, conteudo, index))).then((value) {
      if (value != null) {
        notas[index].conteudo = '$value';
        savenotas();
      }
    });
    savenotas();
  }

  String recebeConteudo(Future<void> content) {
    String conteudo = "$content";

    return conteudo;
  }

  String getDataFormatada(DateTime data) {
    final DateFormat formatter = DateFormat('dd-MM-yy');
    final String formated = formatter.format(data);

    return formated;
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text(
        selectedList.isEmpty
            ? "Bloco de Notas"
            : "${selectedList.length} itens selecionados",
        textAlign: TextAlign.start,
      ),
      actions: [
        selectedList.isEmpty
            ? Container()
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < selectedList.length; i++) {
                      notas.removeWhere((element) =>
                          element.titulo == selectedList[i].titulo);
                    }
                    selectedList.clear();
                  });
                },
              )
      ],
    );
  }

  GridTile gridTile(index) {
    return GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.transparent,
          title: Text(
            getDataFormatada(notas[index].dataLastEdited),
            textAlign: TextAlign.center,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListTile(
              selected: notas[index].isSelected,
              selectedColor: Colors.grey,
              title: Text(
                notas[index].titulo,
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Theme.of(context).colorScheme.secondary,
              onTap: () {
                if (selectedList.isEmpty) {
                  pusharPag(notas, index, context);
                } else {
                  switch (notas[index].isSelected) {
                    case true:
                      setState(() {
                        selectedList.remove(notas[index]);
                        notas[index].isSelected = false;
                      });
                      break;
                    case false:
                      setState(() {
                        notas[index].isSelected = true;
                        selectedList.add(notas[index]);
                      });
                      break;
                  }
                }
              },
              onLongPress: () {
                setState(() {
                  if (!selectedList.contains(notas[index])) {
                    notas[index].isSelected = true;
                    selectedList.add(notas[index]);
                  }
                });
              },
            ),
            notas[index].isSelected
                ? const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }
}
