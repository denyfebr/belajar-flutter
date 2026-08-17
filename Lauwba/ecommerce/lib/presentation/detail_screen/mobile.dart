import 'package:ecommerce/presentation/home_creen/components/detail_images_carousel.dart';
import 'package:ecommerce/presentation/home_creen/components/detail_product_info.dart';
import 'package:ecommerce/providers/handlers.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/product/DetailProduct.dart' as detailProductModel;
import '../../providers/cart_provider.dart';
import '../../utils/number_format.dart';
import '../global_widgets/cart_button.dart';

class MobileDetailScreen extends StatelessWidget {
  const MobileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      floatingActionButton: CartButton(),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          return dataStateBuilder<detailProductModel.Data>
            (
              context,
              dataStateModel: productProvider.detailProductState,
              onLoading: ListView(
                children: [
                  DetailImagesCarousel(isLoading: true,),
                  DetailProductInfo(isLoading: true,)
                ],
              ),
              onSuccess: (val,msg){
                return ListView(
                  children: [
                    DetailImagesCarousel(data: val,),
                    DetailProductInfo(data: val,)
                  ],
                );
              },
            );
        }
      ),

      bottomNavigationBar: Container(
        // Properti Container luar
          height: 130, // Tetap 120 seperti permintaan
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Tambahkan padding untuk konten di dalamnya
          decoration: BoxDecoration(
            color: Colors.white, // Ganti dengan warna latar belakang yang sesuai
            border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1.0)), // Tambahkan garis atas jika diperlukan
          ),

          // Menggantikan ListTile dengan Row untuk tata letak horizontal
          child: Consumer2<CartProvider, ProductProvider>(
            builder: (context, cartProvider, productProvider, _) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jaga jarak antara "Total" dan tombol
                  crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan secara vertikal
                  children: [
                    // Sisi Kiri: Teks "Total" dan "Rp 10000000"
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 14), // Sesuaikan ukuran/gaya teks
                        ),
                        (productProvider.detailProductState.data != null) ? Text(
                          MyNumberFormat.rupiah(productProvider.detailProductState.data!.price!.toInt()*cartProvider.qty),
                          //"Rp ${productProvider.detailProductState.data!.price!.toInt()*cartProvider.qty}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Sesuaikan warna
                          ),
                        ): Text(
                          "Rp 0"),
                      ],
                    ),

                    // Sisi Kanan: Kontrol Kuantitas dan Tombol Aksi
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Baris Kontrol Kuantitas
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton.filled(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cartProvider.minQty();
                                },
                                icon: Icon(Icons.remove)
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Beri sedikit jarak
                              child: Text(cartProvider.qty.toString(),style: TextStyle(fontSize: 16),),
                            ),
                            IconButton.filled(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cartProvider.addQty();
                                },
                                icon: Icon(Icons.add)
                            ),
                          ],
                        ),

                        SizedBox(height: 10), // Jarak antara kontrol kuantitas dan tombol

                        // Baris Tombol Aksi
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("Beli")
                            ),
                            SizedBox(width: 10),
                            OutlinedButton(
                                onPressed: () {
                                  cartProvider.addOrUpdate(
                                      productProvider.detailProductState.data!.id!.toInt(),
                                      cartProvider.qty
                                  );
                                },
                                child: Text("+ Keranjang")
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
            }
          ),
          ),
    );
  }
}
