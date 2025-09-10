import 'package:flutter/material.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteMovies;
  final Function(Map<String, dynamic>, bool) onFavoriteToggle; // ⬅️ callback

  const FavoriteScreen({
    super.key,
    required this.favoriteMovies,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "❤️ Favorite",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE0BBE4), // ungu pastel
              Color(0xFF957DAD), // ungu soft
              Color(0xFFB5EAD7), // hijau mint pastel
              Color(0xFFC7CEEA), // biru pastel
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: favoriteMovies.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada film favorit",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: favoriteMovies.length,
                padding: const EdgeInsets.only(
                    top: 100, left: 16, right: 16, bottom: 20),
                itemBuilder: (context, index) {
                  final movie = favoriteMovies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            movie: movie,
                            onFavoriteToggle: (isFav) {
                              onFavoriteToggle(movie, isFav); // sync ke Home
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
                          // Poster film
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
                          // Info film
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
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
                          // Icon Favorite (biar bisa hapus dari favorit)
                          IconButton(
                            icon: const Icon(Icons.favorite,
                                color: Colors.pinkAccent, size: 28),
                            onPressed: () {
                              onFavoriteToggle(movie, false); // un-fav
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
