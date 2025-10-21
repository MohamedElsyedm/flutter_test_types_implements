import 'package:flutter/material.dart';

class CounterIncrement extends StatefulWidget {
  const CounterIncrement({super.key});

  @override
  State<CounterIncrement> createState() => _CounterIncrementState();
}

class _CounterIncrementState extends State<CounterIncrement> {
  int counter = 0;
  num result = 0;

  final numberController = TextEditingController();

  void _calculateTheSquare() {
    num numberInput = num.parse(numberController.text.trim());

    setState(() {
      result = numberInput * numberInput;
    });
  }

  void _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
            ),
            Text("$counter"),
            Text("$result"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _increment, child: const Text('Add One')),
            const SizedBox(height: 20),
            ElevatedButton(
              key: Key('calculate_btn'),
              onPressed: _calculateTheSquare,
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
