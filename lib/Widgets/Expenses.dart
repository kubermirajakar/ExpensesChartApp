import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:expensetracker/Widgets/AddExpenses.dart';
import 'package:expensetracker/Widgets/Chart.dart';
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
      useSafeArea: true,
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
    final width = MediaQuery.of(context).size.width;
    print(width);

    Widget mainContent = Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty_outlined,
              size: 40,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'No expenses found!!!, Try adding new items',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpenses,
        onDelete: romoveExpense,
        openAddModel: _openAddModel,
      );
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
        body: width < 550
            ? Column(
                children: [
                  Chart(expenses: _registerdExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: _registerdExpenses),
                  ),
                  Expanded(child: mainContent),
                ],
              ));
  }
}
