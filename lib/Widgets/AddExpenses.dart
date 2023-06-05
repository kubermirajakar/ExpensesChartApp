import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  AddExpenses({super.key, required this.addExpense});

  final void Function(ExpensesModel expensesModel) addExpense;

  @override
  State<StatefulWidget> createState() {
    return _AddExpenses();
  }
}

class _AddExpenses extends State<AddExpenses> {
  // var data = '';

  // void _addTitle(String str) {
  //   data = str;
  // }
  //
  final _addTitle = TextEditingController();
  final _addPrice = TextEditingController();

  @override
  void dispose() {
    _addTitle.dispose();
    _addPrice.dispose();
    super.dispose();
  }

  DateTime? _date;
  Categories _selectedCategories = Categories.other;

  void _openDataRange() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5, now.month, now.day);
    final _selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _date = _selectedDate;
    });
  }

  void onSaving() {
    final enterdAmount = double.tryParse(_addPrice.text);
    final amountInavlid = enterdAmount == null || enterdAmount <= 0;

    if (_addTitle.text.trim().isEmpty || amountInavlid || _date == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Wrong input'),
              content: Text('Enter valid title, price and date'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('Okay'),
                ),
              ],
            );
          });
      return;
    }

    widget.addExpense(
      ExpensesModel(
          date: _date!,
          price: enterdAmount,
          title: _addTitle.text,
          category: _selectedCategories),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, space + 16),
          child: Column(
            children: [
              TextField(
                // onChanged: _addTitle,
                controller: _addTitle,
                maxLength: 50,
                decoration: InputDecoration(
                  label: const Text('Title'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      // onChanged: _addTitle,
                      controller: _addPrice,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '\$ ',
                        label: const Text('Price'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_date == null
                          ? 'Select Date'
                          : formater.format(_date!)),
                      IconButton(
                        onPressed: _openDataRange,
                        icon: Icon(Icons.date_range),
                      ),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategories,
                    items: Categories.values
                        .map(
                          (Category) => DropdownMenuItem(
                            value: Category,
                            child: Text(
                              Category.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategories = value as Categories;
                      });
                    },
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 9),
                  ElevatedButton(
                    onPressed: onSaving,
                    child: const Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
