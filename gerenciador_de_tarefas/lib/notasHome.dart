import 'package:flutter/material.dart';

class NotasHome extends StatefulWidget {
  const NotasHome({super.key});

  @override
  _NotasHomeState createState() => _NotasHomeState();
}

class _NotasHomeState extends State<NotasHome> {
  List<String> notas = ["+"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 10,
              maxCrossAxisExtent: 150,
              mainAxisExtent: 175,
              mainAxisSpacing: 10),
          itemCount: notas.length,
          itemBuilder: (context, index) {
            return gridTile(index);
          },
        ),
      )),
    );
  }

  int notasCount = 0;

  Widget gridTile(index) {
    if (index == 0) {
      return GridTile(
          child: ListTile(
        title: const Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Theme.of(context).colorScheme.background,
        onTap: addItem,
      ));
    } else {
      return GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.transparent,
            title: Text(
              notas[index],
              textAlign: TextAlign.center,
            ),
          ),
          child: ListTile(
            title: Text(
              notas[index],
              textAlign: TextAlign.center,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Theme.of(context).colorScheme.background,
            onTap: () {},
            onLongPress: () => rmItem(index),
          ));
    }
  }

  void addItem() {
    setState(() {
      notas.add("Nota $notasCount");
      notasCount++;
    });
  }

  void rmItem(int index) {
    setState(() {
      if (index != 0) {
        notas.removeAt(index);
        print(index);
        notasCount--;
      }
    });
  }
}
