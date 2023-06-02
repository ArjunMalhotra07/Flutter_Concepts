import 'package:flutter/material.dart';

import '../domain/models/transaction.dart';
import 'home_page.dart';

class AddTransaction extends StatelessWidget {
  final String? nameField;
  final double? amountField;
  final Transaction? transaction;

  AddTransaction(
      {this.amountField, this.transaction, this.nameField, super.key});
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
              decoration: InputDecoration(
                hintText: transaction?.name ?? 'Name',
              ),
              controller: name,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: transaction?.amount == null
                      ? 'Amount'
                      : transaction?.amount.toString()),
              controller: amount,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  transaction == null
                      ? addTransaction(
                          name.text, double.parse(amount.text), true)
                      : editTransaction(
                          transaction!, name.text, double.parse(amount.text));
                },
                child: transaction == null
                    ? const Text('Add')
                    : const Text('Edit'))
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
    /* 
      final myBox = Boxes.getTransaction();
      final myTransaction = myBox.get('key');
    */
  }

  editTransaction(Transaction transaction, String name, double amount) {
    transaction.name = name;
    transaction.amount = amount;
    transaction.isExpense = true;
    transaction.createdDate = DateTime.now();
    transaction.save();
  }
}
