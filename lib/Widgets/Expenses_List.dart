import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:expensetracker/Widgets/ExpensesItem.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses, required this.onDelete});

  final List<ExpensesModel> expenses;

  final void Function(ExpensesModel expensesModel) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => onDelete(expenses[index]),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
