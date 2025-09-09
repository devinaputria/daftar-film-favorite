import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> movies = [
  {
    "title": "Bila esok ibu tiada",
    "year": "2014",
    "poster": "assets/bila_esok_ibu_tiada.jpeg",
  },
  {
    "title": "Baby blues",
    "year": "2018",
    "poster": "assets/baby_blues.jpeg",
  },
];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Film"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: movies.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie["poster"]!,
                  width: 60,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(movie["title"]!),
              subtitle: Text(movie["year"]!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
