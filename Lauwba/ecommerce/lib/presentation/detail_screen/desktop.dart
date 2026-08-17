import 'dart:convert';

import 'package:ecommerce/data/model/product/DetailProduct.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../home_creen/components/detail_images_carousel.dart';
import '../home_creen/components/detail_product_info.dart';

class DesktopDetailScreen extends StatelessWidget {
  const DesktopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/logo-ecom.png"),
        title: Text("Ecommerce"),
      ),

      body: Column(
        children: [
          Row(
            children: [
              //   gambar
              DetailImagesCarousel(isLoading: true,),
              //   kotak putih
              Expanded(
                child: DetailProductInfo(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



