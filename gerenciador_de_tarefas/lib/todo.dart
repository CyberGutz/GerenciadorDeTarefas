import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A Fazer'),
      ),
      body: Center(
        child: Row(children: const <Widget>[Text('Placeholder')]),
      ),
    );
  }
}
