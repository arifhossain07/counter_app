import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counter_provider.dart';
import 'home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5A67AD)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
