import 'package:flutter/material.dart';

class Notas extends StatelessWidget {
  const Notas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [ListTile(title: const Text('Bloco de Notas'))],
          //https://stackoverflow.com/questions/56390884/flutterdynamically-add-remove-an-item-in-listview-on-button-click
        ),
      ),
    );
  }
}
