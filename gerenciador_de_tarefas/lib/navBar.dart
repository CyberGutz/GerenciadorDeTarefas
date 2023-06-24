import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/notasHome.dart';
import 'package:gerenciador_de_tarefas/lembretes.dart';
import 'package:gerenciador_de_tarefas/configs.dart';
import 'package:gerenciador_de_tarefas/theme_model.dart';
import 'package:gerenciador_de_tarefas/todo.dart';
import 'package:provider/provider.dart';

//Índice de seleção da tela
int _selectedIndex = 0; //_

//vetor de telas
List<Widget> _stOptions = <Widget>[
  ToDo(),
  Lembrete(),
  NotasHome(),
  Configs(),
];

class NavBar extends StatefulWidget {
  int _opcao;

  NavBar(this._opcao);

  @override
  _NavBarState createState() => _NavBarState(this._opcao);
}

class _NavBarState extends State<NavBar> {
  _NavBarState(this._opcao);
  int _opcao;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = _opcao;
  }

  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Task View",
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  setState(() {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  });
                })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('Gerenciador de Tarefas')),
              ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: const Text('Lembretes'),
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: const Text('Bloco de Notas'),
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: const Text('Configurações'),
                  onTap: () {
                    _onItemTapped(3);
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
        body: _stOptions.elementAt(_selectedIndex),
      );
    });
  }
}
