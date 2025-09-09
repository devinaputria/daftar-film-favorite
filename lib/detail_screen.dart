import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie["title"]!)),
      body: Column(
        children: [
          Image.asset(movie["poster"]!),
          const SizedBox(height: 16),
          Text(
            movie["title"]!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Tahun: ${movie["year"]}"),
        ],
      ),
    );
  }
}
