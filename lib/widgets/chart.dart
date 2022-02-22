import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/chart.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  const Chart(this._recentTransactions, {Key? key}) : super(key: key);

  List<ChartItem> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (final transaction in _recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }
      return ChartItem(
          DateFormat.E().format(weekDay).substring(0, 1), totalSum);
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions
                .map(
                  (item) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        label: item.day,
                        spendingAmount: item.amount,
                        spendingPercentage: totalSpending == 0.0
                            ? 0.0
                            : item.amount / totalSpending),
                  ),
                )
                .toList()),
      ),
    );
  }
}
