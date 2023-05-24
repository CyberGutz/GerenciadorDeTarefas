import 'package:flutter/material.dart';

class Relogio extends StatelessWidget {
  const Relogio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relógio'),
      ),
      body: Center(
        child: Row(children: const <Widget>[Text('Placeholder')]),
      ),
    );
  }
}
