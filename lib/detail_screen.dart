import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> movie;
  final Function(bool) onFavoriteToggle; // callback ke HomeScreen

  const DetailScreen({
    super.key,
    required this.movie,
    required this.onFavoriteToggle,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.movie["isFavorite"] ?? false;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.movie["isFavorite"] = isFavorite;
    });

    // kasih tahu HomeScreen supaya ikut update
    widget.onFavoriteToggle(isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.movie["title"],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.pinkAccent,
              size: 28,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Poster (full width & tidak terpotong)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Image.asset(
                  widget.movie["poster"],
                  width: double.infinity,
                  fit: BoxFit.contain, // 🔥 biar utuh
                ),
              ),

              // Card transparan untuk detail
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.movie["title"],
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "Tahun: ${widget.movie["year"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Genre: ${widget.movie["genre"] ?? '-'}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Sinopsis",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.movie["synopsis"] ?? "Sinopsis belum tersedia.",
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
