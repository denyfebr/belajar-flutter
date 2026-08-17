import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier{

  _staticList() {
    return [
      NewsModel(
        title: "Flutter 3.19 Dirilis: Apa yang Baru?",
        description: "Google baru saja merilis versi terbaru Flutter dengan peningkatan performa Gemini AI dan Impeller.",
        imageUrl: "https://picsum.photos/id/1/200/200", // Gambar placeholder
        date: "27 Nov 2025",
        author: "Tekno Indo",
      ),
      NewsModel(
        title: "Perkembangan AI di Tahun 2025",
        description: "Kecerdasan buatan semakin mendominasi industri teknologi, mulai dari kesehatan hingga otomotif.",
        imageUrl: "https://picsum.photos/id/20/200/200",
        date: "26 Nov 2025",
        author: "Sains Harian",
      ),
      NewsModel(
        title: "Tips Menjadi Mobile Developer Handal",
        description: "Pelajari roadmap lengkap untuk menjadi developer aplikasi mobile yang dicari perusahaan.",
        imageUrl: "https://picsum.photos/id/3/200/200",
        date: "25 Nov 2025",
        author: "Dev Corner",
      ),
      NewsModel(
        title: "Wisata Alam Terbaik di Indonesia",
        description: "Daftar 10 destinasi wisata alam yang wajib dikunjungi sebelum tahun berakhir.",
        imageUrl: "https://picsum.photos/id/10/200/200",
        date: "24 Nov 2025",
        author: "Travel Yuk",
      ),
      NewsModel(
        title: "Resep Masakan Nusantara Paling Populer",
        description: "Kumpulan resep makanan tradisional yang mudah dibuat di rumah.",
        imageUrl: "https://picsum.photos/id/22/200/200",
        date: "23 Nov 2025",
        author: "Dapur Ibu",
      ),
    ];
  }

  bool isLoading = false;

  List<NewsModel> _newList = [];
  List<NewsModel> get newsList => _newList;

  fetchNews() async{
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    _newList = _staticList();
    notifyListeners();
  }
}

class NewsModel {
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String author;

  NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.author,
  });
}