import 'package:flutter/material.dart';

class HomeSubscreen extends StatefulWidget {
  const HomeSubscreen({super.key});

  @override
  State<HomeSubscreen> createState() => _HomeSubscreenState();
}

class _HomeSubscreenState extends State<HomeSubscreen> {
  List<Map<String, dynamic>> news = [
    {
      "link_url":
      "https://raminten.com/wp-content/uploads/2024/07/tugu-jogja.jpg",
      "category": "Wisata",
      "title": "Tempat Wisata yang bagus di Jogja tahun 2025",
    },
    {
      "link_url":
      "https://raminten.com/wp-content/uploads/2025/01/Tempat-makan-nuansa-alam-di-Jogja-Murah.jpg",
      "category": "Wisata",
      "title": "Menelusuri wisata jalan malioboro",
    },
  ];

  TextEditingController textImageUrl = TextEditingController();
  TextEditingController textTitle = TextEditingController();
  TextEditingController textCategory = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // listview dibungkus oleh Expanded agar ukuran height dari listview selalu menyesuaikan denngan space yang ada pada layar
        Expanded(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) => ItemNews(
              imgurl: news[index]['link_url'],
              title: news[index]['category'],
              category: news[index]['title'],
            ),
          ),
        ),
        Column(
          children: [
            // membuat form
            TextFormField(
              controller: textImageUrl,
              decoration: InputDecoration(
                hint: Text("Image URL..."),
              ),
            ),
            TextFormField(
              controller: textTitle,
              decoration: InputDecoration(
                hint: Text("Title..."),
              ),
            ),
            TextFormField(
              controller: textCategory,
              decoration: InputDecoration(
                hint: Text("Category..."),
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                //menambahkan data ke list news
                news.add({
                  "link_url" : textImageUrl.text,
                  "category" : textCategory.text,
                  "title" : textTitle.text
                });
                //menghapus semua nilai pada input data ke list news
                textImageUrl.clear();
                textTitle.clear();
                textCategory.clear();
              });
              // muncul pesan alertnya, pesan sukses ditambahkan
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berita telah ditambahkan")));
            }, child: Text("Add List")),
          ],
        )
      ],
    );
  }
}

class ItemNews extends StatelessWidget {
  final String imgurl, title, category;

  const ItemNews({
    super.key,
    required this.imgurl,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min, // tinggi menyesuaikan kontennya
          crossAxisAlignment: CrossAxisAlignment.start, // buat rata kiri
          children: [
            Image.network(
              imgurl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 8),
              child: Text(category),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}