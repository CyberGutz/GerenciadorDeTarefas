import 'package:flutter/material.dart';

class Notas extends StatelessWidget {
  const Notas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(children: const <Widget>[Text('Bloco de Notas')]),
      ),
    );
  }
}
