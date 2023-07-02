import 'package:flutter/material.dart';
import 'package:gerenciador_de_tarefas/navBar.dart';
import 'package:provider/provider.dart';
import 'package:gerenciador_de_tarefas/theme_model.dart';

import 'appTheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:
                themeNotifier.isDark ? AppTheme.darkTheme : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: NavBar(initialIndex: 0),
          );
        },
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeModel>(
//         builder: (context, ThemeModel themeNotifier, child) {
//       return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "Gerenciador De Tarefas",
//             textAlign: TextAlign.center,
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(themeNotifier.isDark
//                     ? Icons.nightlight_round
//                     : Icons.wb_sunny),
//                 onPressed: () {
//                   themeNotifier.isDark
//                       ? themeNotifier.isDark = false
//                       : themeNotifier.isDark = true;
//                 })
//           ],
//         ),

//         // body: ListView(
//         //   children: [
//         //     Card(
//         //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
//         //       child: Checkbox(,)
//         //     )
//         //   ],)
//         body: ListView.builder(itemBuilder: (BuildContext context, int index) {
//           return Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
//             child: const Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Text(
//                 "Tarefa.",
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//           );
//         }),
//         drawer: NavBar(0),
//       );
//     });
//   }
// }