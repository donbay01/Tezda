import 'package:e_commerce/commerce.dart';
import 'package:flutter/material.dart';

class Tezda extends StatelessWidget {
  const Tezda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const TezdaApp(),
    );
  }
}
