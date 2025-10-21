import 'package:flutter/material.dart';

class LongItemsPage extends StatelessWidget {
  final List<String> items;
  const LongItemsPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index], key: Key('item_${index}_text')),
            );
          },
        ),
      ),
    );
  }
}
