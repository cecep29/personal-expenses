import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: const ColorScheme.light(secondary: Colors.amber),
      ),
      title: "Expenses App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 76.55, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Jacket', amount: 50.55, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final transactionData = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _transactions.add(transactionData);
    });
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _showNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(transactionHandler: _addTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text('Chart'),
              ),
            ),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
