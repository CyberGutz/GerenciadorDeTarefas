import 'package:flutter/material.dart';

class Alarme extends StatelessWidget {
  const Alarme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarmes'),
      ),
      body: Center(
        child: Row(children: const <Widget>[Text('Placeholder')]),
      ),
    );
  }
}
