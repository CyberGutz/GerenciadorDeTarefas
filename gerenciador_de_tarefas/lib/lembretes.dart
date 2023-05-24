import 'package:flutter/material.dart';

class Lembrete extends StatelessWidget {
  const Lembrete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lembretes'),
      ),
      body: Center(
        child: Row(children: const <Widget>[Text('Placeholder')]),
      ),
    );
  }
}
