
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/model/product/DetailProduct.dart';
import '../../../utils/number_format.dart';

class DetailProductInfo extends StatelessWidget {

  final Data? data;
  final bool isLoading;

  const DetailProductInfo({
    super.key, this.data, this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Data dataDummy = Data(
      name: "Product Name",
      category: "Category",
      price: 1000000,
      description: "Description",
    );
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        margin: getDeviceType(size) == DeviceScreenType.desktop ? EdgeInsets.symmetric(horizontal: 10): EdgeInsets.zero,
        padding: getDeviceType(size) == DeviceScreenType.desktop ? EdgeInsets.symmetric(horizontal: 10, vertical: 5): EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100, blurRadius: 10, spreadRadius: 1)
            ]
      
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data == null ? dataDummy.category! :data!.category!),
            Text(data == null ? dataDummy.name! : data!.name!, style: Theme.of(context).textTheme.headlineSmall,),
            Text(MyNumberFormat.rupiah((data != null ? data!.price!:dataDummy.price!).toInt()), style: Theme.of(context).textTheme.headlineMedium,),
            Text(data == null ? dataDummy.description! :data!.description!, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.justify,),
          ],
        ),
      ),
    );
  }
}