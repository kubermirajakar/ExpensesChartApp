import 'package:expensetracker/Widgets/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

final formater = DateFormat.yMd();

enum Categories { travel, food, work, other }

final CategoryIcons = {
  Categories.travel: Icons.flight_takeoff,
  Categories.food: Icons.lunch_dining,
  Categories.work: Icons.work,
  Categories.other: Icons.devices_other
};

class ExpensesModel {
  ExpensesModel(
      {required this.date,
      required this.price,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double price;
  final DateTime date;
  final String id;
  final Categories category;

  String get getDateFormat {
    return formater.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  final Categories category;
  final List<ExpensesModel> expenses;

  ExpenseBucket.forCategory(List<ExpensesModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.price;
    }

    return sum;
  }
}
