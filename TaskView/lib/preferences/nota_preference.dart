import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../notas/nota.dart';

class NotaPreferences {
  static const String _kNoteListKey = 'noteList';

  // Salva a lista de tarefas no SharedPreferences
  static Future<void> saveNotas(List<Nota> notas) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> noteJsonList =
        notas.map((notas) => jsonEncode(notas.toJson())).toList();
    await prefs.setStringList(_kNoteListKey, noteJsonList);
  }

  // Carrega a lista de tarefas do SharedPreferences
  static Future<List<Nota>> loadNotas() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? noteJsonList = prefs.getStringList(_kNoteListKey);
    if (noteJsonList == null) {
      return [];
    }
    return noteJsonList
        .map((noteJson) => Nota.fromJson(jsonDecode(noteJson)))
        .toList();
  }
}
