import 'package:flutter/material.dart';
import 'package:speed_programming/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie["title"]),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // ⬅️ semua ke tengah
          children: [
            // Poster film
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                movie["poster"],
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 12),

            // Judul
            Text(
              movie["title"],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            // Tahun rilis
            Text(
              "Tahun: ${movie["year"]}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Genre
            Text(
              "Genre: ${movie["genre"] ?? '-'}",
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Sinopsis
            const Text(
              "Synopsis",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              movie["synopsis"] ?? "Sinopsis belum tersedia.",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center, // ⬅️ sinopsis juga rata tengah
            ),
          ],
        ),
      ),
    );
  }
}
