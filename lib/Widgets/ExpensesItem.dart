import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  ExpensesItem(this.expense, {super.key});

  final ExpensesModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(expense.title),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text('\$' + expense.price.toStringAsFixed(2)),
                  Spacer(),
                  Row(
                    children: [
                      Icon(CategoryIcons[expense.category]),
                      SizedBox(
                        width: 4,
                      ),
                      Text(expense.getDateFormat)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
