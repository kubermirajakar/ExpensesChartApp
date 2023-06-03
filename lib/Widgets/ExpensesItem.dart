import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:expensetracker/Widgets/AddExpenses.dart';
import 'package:expensetracker/Widgets/Expenses.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatefulWidget {
  ExpensesItem(this.expense, {super.key, required this.openAddModel});

  final ExpensesModel expense;
  final void Function() openAddModel;
  @override
  State<ExpensesItem> createState() {
    return _ExpenseItem();
  }
}

class _ExpenseItem extends State<ExpensesItem> {
  void openAdd() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      autofocus: false,
      onPressed: widget.openAddModel,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.expense.title,
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text('\$' + widget.expense.price.toStringAsFixed(2)),
                  Spacer(),
                  Row(
                    children: [
                      Icon(CategoryIcons[widget.expense.category]),
                      SizedBox(
                        width: 4,
                      ),
                      Text(widget.expense.getDateFormat)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
