import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:portal_berita/api/ListBerita.dart';
import 'package:portal_berita/api/api.dart';
import 'package:portal_berita/textstyle_constant.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data>? listBerita;

  Data dummyBerita = Data(
    fotoNews:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNJaxzaqGT7Sv7IRZYTudWkISQtMQ2htuoog&s",
    jdlNews: "Lorem ipsum dolor amet",
    postOn: "tanggal berita...",
  );

  fetchListBerita() {
    Api.getListBerita()
        .then((value) {
          setState(() {
            listBerita = value.data;
          });
        })
        .catchError((error) {
          print(error);
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchListBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portal Berita")),
      body: ListView(
        children: [
          Skeletonizer(
            enabled: listBerita == null,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
              ),
              // menampilkan hanya 5 list berita pada carousel slider (jika ada). jika kosong, maka muncul dummy
              items: (listBerita == null ? [dummyBerita] : listBerita!.take(5))
                  .map((value) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Stack(
                        children: [
                          Image.network(
                            value.fotoNews!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),

                          //menempatkan teks di bawah gambar
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Text(
                              value.jdlNews!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: MyFont.heading3.copyWith(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                  .toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Berita terkini", style: MyFont.heading3),
          ),

          Skeletonizer(
            enabled: listBerita == null,
            child: ListView.builder(
              // meninaktifkan fungsi scroll pada listview, generate item berita sampai
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listBerita == null ? 7 : listBerita!.length,
              itemBuilder: (context, index) {
                Data itemData = listBerita != null
                    ? listBerita![index]
                    : Data(
                        fotoNews:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNJaxzaqGT7Sv7IRZYTudWkISQtMQ2htuoog&s",
                        jdlNews:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                        postOn: "Tanggal berita .. ",
                      );
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(id: itemData.id!),
                        ),
                      );
                    },
                    leading: Image.network(
                      itemData.fotoNews!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return FlutterLogo(size: 50);
                      },
                    ),
                    title: Text(itemData.jdlNews!, style: MyFont.heading3),
                    subtitle: Text(itemData.postOn!, style: MyFont.paragraph),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
