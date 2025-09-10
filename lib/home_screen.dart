import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> movies = [
    {
      "title": "Bila Esok Ibu Tiada",
      "year": "2024",
      "poster": "assets/images/bila_esok_ibu_tiada.jpg",
      "genre": "Keluarga",
      "synopsis": "Kisah haru seorang ibu yang mengidap penyakit kritis...",
      "isFavorite": false,
    },
    {
      "title": "Baby Blues",
      "year": "2022",
      "poster": "assets/images/baby_blues.jpg",
      "genre": "Komedi",
      "synopsis": "Pasangan muda menghadapi perubahan besar setelah punya anak...",
      "isFavorite": false,
    },
    {
      "title": "Dilan",
      "year": "2019",
      "poster": "assets/images/dilan.jpg",
      "genre": "Romance",
      "synopsis": "Milea bertemu Dilan, cowok unik penuh rayuan...",
      "isFavorite": false,
    },
    {
      "title": "Komang",
      "year": "2025",
      "poster": "assets/images/komang.jpg",
      "genre": "Romance",
      "synopsis": "Kisah pemuda Bali bernama Komang yang mengejar mimpi musik...",
      "isFavorite": false,
    },
    {
      "title": "Gereja Setan",
      "year": "2025",
      "poster": "assets/images/gereja_setan.jpg",
      "genre": "Horor",
      "synopsis": "Sekelompok remaja masuk ke gereja tua berhantu...",
      "isFavorite": false,
    },
  ];

  void toggleFavorite(Map<String, dynamic> movie, bool isFav) {
    setState(() {
      movie["isFavorite"] = isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "🎬 Daftar Film",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              final favorites =
                  movies.where((m) => m["isFavorite"] == true).toList();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoriteScreen(
                    favoriteMovies: favorites,
                    onFavoriteToggle: toggleFavorite, // ⬅️ penting
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE0BBE4), // ungu pastel
              Color(0xFF957DAD), // ungu soft
              Color(0xFFB5EAD7), // hijau mint pastel
              Color(0xFFC7CEEA), // biru muda pastel
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: movies.length,
          padding: const EdgeInsets.only(
              top: 100, left: 16, right: 16, bottom: 20),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
                      movie: movie,
                      onFavoriteToggle: (isFav) {
                        toggleFavorite(movie, isFav);
                      },
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Poster
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(16),
                      ),
                      child: Image.asset(
                        movie["poster"],
                        width: 100,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Info Film
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie["title"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Tahun: ${movie["year"]}",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Genre: ${movie["genre"]}",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Tombol Favorit
                    IconButton(
                      icon: Icon(
                        movie["isFavorite"]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.pinkAccent,
                        size: 28,
                      ),
                      onPressed: () {
                        toggleFavorite(movie, !movie["isFavorite"]);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
