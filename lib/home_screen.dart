import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> movies = [
      {
        "title": "Bila Esok Ibu Tiada",
        "year": "2024",
        "poster": "assets/images/bila_esok_ibu_tiada.jpg",
        "genre": "Keluarga",
        "synopsis": "Kisah haru seorang ibu yang mengidap penyakit kritis. "
            "Anak-anaknya harus menghadapi kenyataan pahit sambil "
            "belajar arti pengorbanan, kehilangan, dan pentingnya "
            "kebersamaan keluarga.",
      },
      {
        "title": "Baby Blues",
        "year": "2022",
        "poster": "assets/images/baby_blues.jpg",
        "genre": "Komedi",
        "synopsis": "Setelah kelahiran anak pertama, pasangan muda ini dihadapkan "
            "pada perubahan besar dalam hidup mereka. Rasa lelah, stres, "
            "dan konflik rumah tangga membuat mereka belajar arti cinta, "
            "kesabaran, dan perjuangan menjadi orang tua baru.",
      },
      {
        "title": "Dilan",
        "year": "2019",
        "poster": "assets/images/dilan.jpg",
        "genre": "Romance",
        "synopsis": "Milea, siswi baru di Bandung, bertemu dengan Dilan, cowok unik "
            "penuh rayuan yang berbeda dari teman-temannya. Dari pertemuan itu "
            "tumbuhlah kisah cinta remaja yang penuh kenangan manis dan konflik "
            "khas anak SMA tahun 1990-an.",
      },
      {
        "title": "Komang",
        "year": "2025",
        "poster": "assets/images/komang.jpg",
        "genre": "Romance",
        "synopsis": "Terinspirasi dari lagu viral, film ini bercerita tentang perjalanan "
            "seorang pemuda Bali bernama Komang yang berjuang meraih mimpinya di "
            "dunia musik, sekaligus menemukan arti cinta dan keluarga.",
      },
      {
        "title": "Gereja Setan",
        "year": "2025",
        "poster": "assets/images/gereja_setan.jpg",
        "genre": "Horor",
        "synopsis": "Sekelompok remaja penasaran memasuki sebuah gereja tua yang diyakini "
            "tempat pemujaan setan. Namun, rasa penasaran berubah menjadi mimpi "
            "buruk ketika rahasia kelam dan arwah jahat mulai menghantui mereka.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Film"),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                child: Image.asset(
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
