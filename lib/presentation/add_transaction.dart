import 'package:flutter/material.dart';

import '../domain/models/transaction.dart';
import 'home_page.dart';

class AddTransaction extends StatelessWidget {
  AddTransaction({super.key});
  var name = TextEditingController();
  var amount = TextEditingController();
  bool isExpenseVar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              controller: name,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Amount'),
              controller: amount,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  addTransaction(name.text, double.parse(amount.text), true);
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }

  Future addTransaction(String name, double amt, bool isExpense) async {
    final transaction = Transaction()
      ..name = name
      ..createdDate = DateTime.now()
      ..amount = amt
      ..isExpense = isExpense;
    final box = Boxes.getTransactions();
    box.add(transaction);
    //! or Aternatively
    //! box.put('myKey', transaction);
  }
}
