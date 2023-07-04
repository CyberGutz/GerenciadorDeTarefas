import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/tema/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Configs extends StatefulWidget {
  const Configs({super.key});
  @override
  ConfigsState createState() => ConfigsState();
}

class ConfigsState extends State<Configs> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (contex, themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
              title: const Text(
            "Configurações",
            textAlign: TextAlign.start,
          )),
          body: Center(
            child: ListView(
              children: [
                const ListTile(),
                ListTile(
                    title: const Text(
                      "Habilitar/Desabilitar tema escuro",
                      textAlign: TextAlign.start,
                    ),
                    trailing: Switch(
                      value: themeNotifier.isDark ? true : false,
                      onChanged: (value) {
                        setState(() {
                          themeNotifier.isDark = !themeNotifier.isDark;
                        });
                      },
                    )),
              ],
            ),
          ));
    });
  }
}
