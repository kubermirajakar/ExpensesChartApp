import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:expensetracker/Widgets/Expenses_List.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<ExpensesModel> _registerdExpenses = [
    ExpensesModel(
        title: 'flutter course',
        price: 10.22,
        date: DateTime.now(),
        category: Category.food),
    ExpensesModel(
        title: 'Java course',
        price: 19.22,
        date: DateTime.now(),
        category: Category.other),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff984b46),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registerdExpenses),
          )
        ],
      ),
    );
  }
}
