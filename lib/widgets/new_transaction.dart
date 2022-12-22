import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function transactionHandler;
  NewTransaction({Key? key, required this.transactionHandler})
      : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
                onPressed: () =>
                    transactionHandler(titleController, amountController),
                child: const Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
