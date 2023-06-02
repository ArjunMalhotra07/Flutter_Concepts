import 'package:extensions_demonstration/domain/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'add_transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    super.dispose();
    // Hive.close();
    //! Or Alternatively
    Hive.box('transaction').close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: ValueListenableBuilder(
          valueListenable: Boxes.getTransactions().listenable(),
          builder: ((content, box, child) {
            final transactions = box.values.toList().cast<Transaction>();
            print(transactions);
            return contentGen(transactions);
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddTransaction()));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');
}

Widget contentGen(List<Transaction> transactions) {
  return ListView.builder(
    itemCount: transactions.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(transactions[index].name),
        subtitle: Text(
            "${transactions[index].createdDate.day}-${transactions[index].createdDate.month}-${transactions[index].createdDate.year}"),
        trailing: Text(transactions[index].amount.toString()),
      );
    },
  );
}
