import 'package:flutter/material.dart';

class MyWidgets extends StatelessWidget {
  const MyWidgets({
    super.key,
    required this.message,
    required this.title,
    this.icon,
  });

  final String title;
  final String message;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(key: Key('AppBar'), title: Text(title)),
        body: Center(child: Row(children: [Text(message), icon ?? SizedBox()])),
      ),
    );
  }
}
