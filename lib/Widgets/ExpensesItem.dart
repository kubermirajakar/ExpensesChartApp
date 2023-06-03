import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  ExpensesItem(this.expense, {super.key});

  final ExpensesModel expense;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        autofocus: false,
        onPressed: () {},
        child: Card(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(expense.title,
                      style: Theme.of(context).textTheme.titleLarge),
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
        ));
  }
}
