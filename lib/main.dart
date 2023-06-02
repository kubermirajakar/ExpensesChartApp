import 'package:expensetracker/Widgets/Expenses.dart';
import 'package:flutter/material.dart';

var kColorSchhems = ColorScheme.fromSeed(seedColor: Color(0xff7734a4));

void main() {
  return runApp(
    MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchhems,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorSchhems.onPrimaryContainer,
            foregroundColor: kColorSchhems.primaryContainer),
        cardTheme: CardTheme().copyWith(
          color: kColorSchhems.primaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorSchhems.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorSchhems.primaryContainer,
                  fontSize: 15),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
