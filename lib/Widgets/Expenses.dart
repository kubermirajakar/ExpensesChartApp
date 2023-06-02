import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:expensetracker/Widgets/AddExpenses.dart';
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
        category: Categories.food),
    ExpensesModel(
        title: 'Java course',
        price: 19.22,
        date: DateTime.now(),
        category: Categories.other),
  ];

  void _openAddModel() {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (context) => AddExpenses(addExpense: addExpense),
    );
  }

  void addExpense(ExpensesModel expensesModel) {
    setState(() {
      _registerdExpenses.add(expensesModel);
    });
  }

  void romoveExpense(ExpensesModel expensesModel) {
    final index = _registerdExpenses.indexOf(expensesModel);
    setState(() {
      _registerdExpenses.remove(expensesModel);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 4),
        content: Text('Expense Delected..'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registerdExpenses.insert(index, expensesModel);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses fond!!!, Try adding new items'),
    );

    if (_registerdExpenses.isNotEmpty) {
      mainContent =
          ExpensesList(expenses: _registerdExpenses, onDelete: romoveExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuber Flutter Expense Tracker'),
        // backgroundColor: Color(0xff984b46),
        actions: [
          IconButton(
            onPressed: _openAddModel,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [Text('Chart'), Expanded(child: mainContent)],
      ),
    );
  }
}
