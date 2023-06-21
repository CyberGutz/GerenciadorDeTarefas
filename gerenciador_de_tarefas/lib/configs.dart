import 'package:flutter/material.dart';

class Configs extends StatelessWidget {
  const Configs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(children: const <Widget>[Text('Configurações')]),
      ),
    );
  }
}
