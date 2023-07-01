import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/notasHome.dart';
import 'package:gerenciador_de_tarefas/lembretes.dart';
import 'package:gerenciador_de_tarefas/configs.dart';
import 'package:gerenciador_de_tarefas/theme_model.dart';
import 'package:gerenciador_de_tarefas/todo.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;

  NavBar({required this.initialIndex});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  TextStyle _selectedItemStyle = TextStyle(color: Colors.red);

  final List<Widget> _stOptions = <Widget>[
    ToDo(),
    Lembretes(),
    NotasHome(),
    Configs(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeNotifier, child) {
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
                    themeNotifier.isDark = !themeNotifier.isDark;
                  });
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(
                      "\nTaskView \n\n\nMenu Principal",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    textAlign: TextAlign.center,
                    style: _selectedIndex == 0 && themeNotifier.isDark
                        ? _selectedItemStyle
                        : null,
                  ),
                  style: ListTileStyle.drawer,
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Lembretes',
                    textAlign: TextAlign.center,
                    style: _selectedIndex == 1 && themeNotifier.isDark
                        ? _selectedItemStyle
                        : null,
                  ),
                  style: ListTileStyle.drawer,
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Bloco de Notas',
                    textAlign: TextAlign.center,
                    style: _selectedIndex == 2 && themeNotifier.isDark
                        ? _selectedItemStyle
                        : null,
                  ),
                  style: ListTileStyle.drawer,
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Configurações',
                    textAlign: TextAlign.center,
                    style: _selectedIndex == 3 && themeNotifier.isDark
                        ? _selectedItemStyle
                        : null,
                  ),
                  style: ListTileStyle.drawer,
                  selected: _selectedIndex == 3,
                  onTap: () {
                    _onItemTapped(3);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: _stOptions.elementAt(_selectedIndex),
        );
      },
    );
  }
}
