import 'package:expensetracker/Widgets/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorSchhems = ColorScheme.fromSeed(seedColor: Color(0xff7734a4));
var kColorDark = ColorScheme.fromSeed(
  seedColor: Color(0xff47aef2),
  brightness: Brightness.dark,
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );
  runApp(
    MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kColorDark,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorDark.onPrimaryContainer,
            foregroundColor: kColorDark.primaryContainer),
        cardTheme: CardTheme().copyWith(
          color: kColorDark.primaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorDark.primaryContainer),
        ),
        // textTheme: ThemeData().textTheme.copyWith(
        //       titleLarge: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           color: kColorDark.onSecondaryContainer,
        //           fontSize: 15),
        //     ),
      ),
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
                  color: kColorSchhems.onSecondaryContainer,
                  fontSize: 15),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
