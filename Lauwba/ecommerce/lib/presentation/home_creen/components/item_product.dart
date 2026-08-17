import 'package:ecommerce/utils/number_format.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../data/model/product/ListProduct.dart';
import '../../detail_screen/detail_screen.dart';

class ItemProduct extends StatelessWidget {
  final List<Data>? data;
  final isLoading;

  const ItemProduct({super.key, this.data, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    List<Data> dataDummy = [
      Data(
        images: "https://picsum.photos/200/300",
        category: "Category",
        name: "Product Name",
        price: 1000000,
      ),
      Data(
        images: "https://picsum.photos/200/300",
        category: "Category",
        name: "Product Name",
        price: 1000000,
      ),
      Data(
        images: "https://picsum.photos/200/300",
        category: "Category",
        name: "Product Name",
        price: 1000000,
      ),
    ];
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: getDeviceType(size) == DeviceScreenType.desktop ? EdgeInsets.symmetric(horizontal: 100, vertical: 25): EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: GridView.builder(
        itemCount: data == null ? dataDummy.length : data!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getDeviceType(size) == DeviceScreenType.desktop ? 4 : 2,
          childAspectRatio: getDeviceType(size) == DeviceScreenType.desktop ? 1 : 0.5,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(idProduct: data == null ? 0 : data![index].id!.toInt(),)));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    isLoading ? dataDummy[index].images! : data![index].images!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3, top: 5, left: 8),
                    child: Text(
                      isLoading ? dataDummy[index].category! : data![index].category!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5, left: 8),
                    child: Text(
                      isLoading ? dataDummy[index].name! : data![index].name!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 5, left: 8),
                      child: Text(
                        MyNumberFormat.rupiah((isLoading ? dataDummy[index].price! : data![index].price!).toInt()),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
