import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

final formater = DateFormat.yMd();

enum Category { travel, food, work, other }

final CategoryIcons = {
  Category.travel: Icons.flight_takeoff,
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.other: Icons.devices_other
};

class ExpensesModel {
  ExpensesModel(
      {required this.date,
      required this.price,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double price;
  final DateTime date;
  final String id;
  final Category category;

  String get getDateFormat {
    return formater.format(date);
  }
}
