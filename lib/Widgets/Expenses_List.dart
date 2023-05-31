import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:expensetracker/Widgets/ExpensesItem.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses});

  final List<ExpensesModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesItem(
        expenses[index],
      ),
    );
  }
}
