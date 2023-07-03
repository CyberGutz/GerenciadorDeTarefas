import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/nota.dart';
import 'package:gerenciador_de_tarefas/nota_preference.dart';

class NotaPage extends StatefulWidget {
  final String title;
  final int index;
  late String content;

  NotaPage(this.title, this.content, this.index, {super.key});
  @override
  NotaPageState createState() => NotaPageState();
}

class NotaPageState extends State<NotaPage> {
  List<Nota> notas = [];
  late String titulo;
  late String conteudo;
  late int index;
  final _controllerNota = TextEditingController();

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

  // void salvar() {
  //   setState(() {
  //     nota.conteudo = conteudo;
  //     notas[index] = nota;
  //     savenotas();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    loadnotas();
    titulo = widget.title;
    conteudo = widget.content;
    index = widget.index;
    _controllerNota.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              titulo,
              textAlign: TextAlign.start,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context, conteudo);
              },
            ),
          ),
          body: Center(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _controllerNota,
                            maxLines: 25,
                            onChanged: (content) {
                              setState(() {
                                conteudo = content;
                                notas[index].setConteudo(
                                    content); // Atualiza o conteúdo da nota na lista
                              });
                              savenotas();
                            },
                          )
                        ]),
                  )))),
      onWillPop: () async {
        conteudo = _controllerNota.text;
        notas[index]
            .setConteudo(conteudo); // Atualiza o conteúdo da nota na lista
        savenotas();
        Navigator.pop(context, conteudo);
        return true;
      },
    );
  }
}
