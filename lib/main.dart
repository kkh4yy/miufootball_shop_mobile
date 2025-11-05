import 'package:flutter/material.dart';
import 'package:miufootball_shop_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      debugShowCheckedModeBanner: false, // biar tidak ada tulisan "debug"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.pinkAccent[400]),
        useMaterial3: false, // tetap pakai gaya Material 2 agar stabil
      ),
      home: MyHomePage(),
    );
  }
}
