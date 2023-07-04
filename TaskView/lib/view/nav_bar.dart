import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/view/notasHome.dart';
import 'package:gerenciador_de_tarefas/view/lembretes.dart';
import 'package:gerenciador_de_tarefas/view/configs.dart';
import 'package:gerenciador_de_tarefas/view/todo.dart';
import 'package:gerenciador_de_tarefas/tema/theme_model.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;

  NavBar({required this.initialIndex});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final TextStyle _selectedItemStyle = const TextStyle(color: Colors.red);

  // Lista de páginas que poderão ser navegadas.
  final List<Widget> _stOptions = <Widget>[
    const ToDo(),
    const Lembretes(),
    const NotasHome(),
    const Configs(),
  ];

  // Inicia a variável _selectedIndex
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Muda _selectedIndex de acordo com o item clicado no navBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Constrói a página principal base, nela, os conteúdos da lista de páginas vão ser mostrados numa mesma base, sem precisar de navigator.push, mostrando um único AppBar com apenas o título do aplicativo: TaskView
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
