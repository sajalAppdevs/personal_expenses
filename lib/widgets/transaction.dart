import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction _transaction;
  final Function(String) _deleteTransaction;

  const TransactionWidget(this._transaction, this._deleteTransaction,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "$currency${_transaction.amount.toStringAsFixed(2)}",
              ),
            ),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(_transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
            onPressed: () => _deleteTransaction(_transaction.id),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
            )),
      ),
    );
  }
}

class NoTransaction extends StatelessWidget {
  const NoTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "No transactions added yet!",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: Image.asset(
            "assets/images/waiting.png",
            fit: BoxFit.cover,
          ),
          height: 200,
        ),
      ],
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function(String) _deleteTransaction;

  const TransactionList(this._transactions, this._deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: _transactions.isEmpty
          ? const NoTransaction()
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionWidget(
                  _transactions[index],
                  _deleteTransaction,
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
