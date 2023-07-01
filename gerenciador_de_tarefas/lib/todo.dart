import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Classe que representa uma tarefa
class Task {
  String name;
  bool isChecked;
  DateTime creationDate;

  Task(this.name, {this.isChecked = false, required this.creationDate});

  // Converte a tarefa para um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isChecked': isChecked,
      'creationDate': creationDate.toIso8601String(),
    };
  }

  // Cria uma instância de Task a partir de um mapa JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['name'] as String,
      isChecked: json['isChecked'] as bool,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );
  }
}

// Classe responsável pelo armazenamento das tarefas utilizando SharedPreferences
class TaskPreferences {
  static const String _kTaskListKey = 'taskList';

  // Salva a lista de tarefas no SharedPreferences
  static Future<void> saveTasks(List<Task> tasks) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> taskJsonList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList(_kTaskListKey, taskJsonList);
  }

  // Carrega a lista de tarefas do SharedPreferences
  static Future<List<Task>> loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? taskJsonList = prefs.getStringList(_kTaskListKey);
    if (taskJsonList == null) {
      return [];
    }
    return taskJsonList
        .map((taskJson) => Task.fromJson(jsonDecode(taskJson)))
        .toList();
  }
}

// Widget principal da aplicação
class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<Task> tasks = []; // Lista de tarefas

  TextEditingController _taskController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadTasks(); // Carrega as tarefas ao inicializar o widget
  }

  // Carrega as tarefas do SharedPreferences
  void loadTasks() async {
    List<Task> savedTasks = await TaskPreferences.loadTasks();
    setState(() {
      tasks = savedTasks.reversed.toList(); // Inverte a lista de tarefas
    });
  }

  // Salva as tarefas no SharedPreferences
  void saveTasks() async {
    await TaskPreferences.saveTasks(tasks);
  }

  // Mostra o dialog para criar uma nova tarefa
  void _showCreateTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final buttonColor = isDarkMode ? Colors.white : Colors.black;

        return AlertDialog(
          title: const Text('Nova Tarefa'),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              hintText: 'Digite o nome da tarefa',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _taskController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.insert(
                    0, // Insere a nova tarefa no início da lista
                    Task(
                      _taskController.text,
                      creationDate: DateTime.now(),
                    ),
                  );
                  _taskController.clear();
                });
                Navigator.pop(context);
                FocusScope.of(context).unfocus(); // Fecha o teclado
                saveTasks();
              },
              child: Text(
                'Salvar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Mostra o dialog para editar uma tarefa existente
  void _showEditTaskDialog(BuildContext context, int index) {
    _taskController.text = tasks[index].name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final buttonColor = isDarkMode ? Colors.white : Colors.black;

        return AlertDialog(
          title: const Text('Editar Tarefa'),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              hintText: 'Digite o nome da tarefa',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _taskController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks[index].name = _taskController.text;
                  _taskController.clear();
                });
                Navigator.pop(context);
                FocusScope.of(context).unfocus(); // Fecha o teclado
                saveTasks();
              },
              child: Text(
                'Editar',
                style: TextStyle(
                  color: buttonColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Retorna a lista de tarefas filtrada de acordo com a pesquisa
  List<Task> getFilteredTasks() {
    if (_searchQuery.isEmpty) {
      return tasks;
    } else {
      return tasks
          .where((task) =>
              task.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  // Retorna a data formatada para exibição
  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Hoje';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return 'Ontem';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(113, 170, 168, 168),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(
                  color: textColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Pesquisar tarefa',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: getFilteredTasks().length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final task = getFilteredTasks()[index];
                final formattedDate = getFormattedDate(task.creationDate);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0 ||
                        task.creationDate.day !=
                            getFilteredTasks()[index - 1].creationDate.day ||
                        task.creationDate.month !=
                            getFilteredTasks()[index - 1].creationDate.month ||
                        task.creationDate.year !=
                            getFilteredTasks()[index - 1].creationDate.year)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          formattedDate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                    Dismissible(
                      key: Key(task.name),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          setState(() {
                            tasks.removeAt(index);
                          });
                          saveTasks();
                        }
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Checkbox(
                              value: task.isChecked,
                              onChanged: (value) {
                                setState(() {
                                  task.isChecked = value!;
                                });
                                saveTasks();
                              },
                            ),
                            Expanded(
                              child: Text(
                                task.name,
                                style: TextStyle(
                                  color:
                                      task.isChecked ? Colors.grey : textColor,
                                  decoration: task.isChecked
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 255, 82, 2),
                              ),
                              onPressed: () {
                                _showEditTaskDialog(context, index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateTaskDialog(context);
        },
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.onTertiary,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
