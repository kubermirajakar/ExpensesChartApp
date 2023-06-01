import 'package:expensetracker/Model/ExpensesModel.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                  Text(_date == null ? 'Select Date' : formater.format(_date!)),
                  IconButton(
                    onPressed: _openDataRange,
                    icon: Icon(Icons.date_range),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 9),
              ElevatedButton(
                onPressed: () {
                  print(_addTitle.text);
                  print(_addPrice.text);
                },
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
