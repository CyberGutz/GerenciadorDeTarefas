import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/view/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:gerenciador_de_tarefas/tema/theme_model.dart';

import 'tema/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TaskView());
}

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Task View',
            theme:
                themeNotifier.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: NavBar(initialIndex: 0),
          );
        },
      ),
    );
  }
}
