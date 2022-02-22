import 'package:flutter/material.dart';

import '../models/transaction.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final height = constraints.maxHeight;
        return Column(
          children: [
            SizedBox(
              height: height * 0.15,
              child: FittedBox(
                child: Text("$currency${spendingAmount.toStringAsFixed(0)}"),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      }),
    );
  }
}
