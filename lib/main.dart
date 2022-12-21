import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Personal Expenses"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
          ),
          const UserTransaction(),
        ],
      ),
    );
  }
}
