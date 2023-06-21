import 'package:flutter/material.dart';

class Alarme extends StatelessWidget {
  const Alarme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(children: const <Widget>[Text('Lembretes')]),
      ),
    );
  }
}
