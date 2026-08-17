import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/model/product/DetailProduct.dart';

class DetailImagesCarousel extends StatelessWidget {
  final Data? data;
  final bool isLoading;
  const DetailImagesCarousel({
    super.key, this.data, this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Data dataDummy = Data(images: jsonEncode(["https://picsum.photos/200/300"]));
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        width: getDeviceType(size) == DeviceScreenType.desktop ? 300 : double.infinity,
        child: GFCarousel(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          height: getDeviceType(size) == DeviceScreenType.desktop ? 300 : 350, // ukuran 200 untuk mobile, dan 500 untuk desktop
          items: List<String>.from(
              jsonDecode(isLoading ? dataDummy.images! : data!.images!)).map((data) {
            return Container(
              margin: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  data,
                  fit: BoxFit.cover,
                  width: getDeviceType(size) == DeviceScreenType.desktop ? 300 : double.infinity,
                  height: getDeviceType(size) == DeviceScreenType.desktop ? 300 : double.infinity,
                ),
              ),
            );
          }).toList(),
          onPageChanged: (index) {
            // setState(() {
            //   index;
            // });
          },
        ),
      ),
    );
  }
}