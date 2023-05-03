import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gerenciador_de_tarefas/theme_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Gerenciador De Tarefas",
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                  icon: Icon(themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny),
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  })
            ],
          ),
          body:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Tarefa.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            );
          }),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text('Gerenciador de Tarefas')),
              ListTile(title: const Text('Home (TODO LIST)'), onTap: () {}),
              ListTile(title: const Text('Lembretes'), onTap: () {}),
              ListTile(title: const Text('Alarmes'), onTap: () {}),
              ListTile(title: const Text('Relógio'), onTap: () {}),
            ],
          )));
    });
  }
}
