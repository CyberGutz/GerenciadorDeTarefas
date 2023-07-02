import 'package:flutter/material.dart';

class NotaPage extends StatefulWidget {
  final String title;
  late String content;

  NotaPage(this.title, this.content, {super.key});
  @override
  NotaPageState createState() => NotaPageState();
}

class NotaPageState extends State<NotaPage> {
  late String titulo;
  late String conteudo;
  final _controllerNota = TextEditingController();

  @override
  void initState() {
    super.initState();
    titulo = widget.title;
    conteudo = widget.content;
    _controllerNota.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          onChanged: (content) => setState(() {
                            conteudo = content;
                          }),
                        )
                      ]),
                ))));
  }
}
