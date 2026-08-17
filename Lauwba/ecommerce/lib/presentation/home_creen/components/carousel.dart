import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ecommerce/data/model/carousel/ListCarousel.dart';

class CarouselEcommerce extends StatelessWidget {

  final List<Data> data;
  final isLoading;

  const CarouselEcommerce({
    super.key, required this.data,this.isLoading=false
  });

  @override
  Widget build(BuildContext context) {
    List<Data> dataDummy = [
      Data(image: "https://picsum.photos/200/300"),
      Data(image: "https://picsum.photos/200/300"),
      Data(image: "https://picsum.photos/200/300")
    ];
    final size = MediaQuery.of(context).size;
    return Skeletonizer(
      enabled: isLoading,
      child: GFCarousel(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 500),
        height: getDeviceType(size) == DeviceScreenType.desktop ? 500:200,
        items: (isLoading ? dataDummy : data).map((data) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                data.image!,
                fit: BoxFit.cover,
                width: 1000.0,
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
    );
  }
}
