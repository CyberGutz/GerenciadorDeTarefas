import 'package:flutter/material.dart';

class Notas extends StatefulWidget {
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  final notas = [
    "Nota 1",
    "Nota 2",
    "Nota 3",
    "Nota 4",
    "Nota 5",
    "Nota 6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Teste"),
          ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: notas.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(notas[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            //https://stackoverflow.com/questions/56390884/flutterdynamically-add-remove-an-item-in-listview-on-button-click
          ),
          ElevatedButton(onPressed: () {}, child: Text("Teste"))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addItem,
      ),
    );
  }

  void addItem() {
    setState(() {
      notas.add(notas[0]);
    });
  }
}
