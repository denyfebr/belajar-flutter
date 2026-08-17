import 'package:flutter/material.dart';
import 'package:povider_demo/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  // Dummy Data (Data contoh)
  @override
  Widget build(BuildContext context) {
    final newList = Provider.of<NewsProvider>(context, listen: false);
    newList.fetchNews();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita Terkini",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100], // Background agak abu-abu
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {

          if(newsProvider.isLoading){
            return const Center(child: CircularProgressIndicator(),);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: newsProvider.newsList.length,
            itemBuilder: (context, index) {
              final news = newsProvider.newsList[index];
              // Mengembalikan Widget Item Berita
              return NewsItemCard(news: news);
            },
          );
        }
      ),
    );
  }
}

// ---------------------------------------------------------
// 3. WIDGET ITEM (DESIGN KARTU BERITA)
// ---------------------------------------------------------
class NewsItemCard extends StatelessWidget {
  final NewsModel news;

  const NewsItemCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Aksi ketika berita diklik (misal: navigasi ke detail)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Membuka: ${news.title}")),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Gambar
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  news.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                      child: const Icon(Icons.broken_image),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              // Bagian Text (Judul, Deskripsi, Tanggal)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kategori/Author & Tanggal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          news.author,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          news.date,
                          style: const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Judul
                    Text(
                      news.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Deskripsi singkat
                    Text(
                      news.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
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