import 'package:flutter/material.dart';
import 'package:speed_programming/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const TodoApp(title: 'Film'));
}

class TodoApp extends StatelessWidget {
  final String title;
  const TodoApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
              home: const HomeScreen()
    );
  }
}
