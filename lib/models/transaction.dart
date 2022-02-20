import 'dart:io';

import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}

final currency =
    NumberFormat.simpleCurrency(locale: Platform.localeName).currencySymbol;
