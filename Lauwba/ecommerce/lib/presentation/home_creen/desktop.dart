import 'package:ecommerce/providers/carousel_provider.dart';
import 'package:ecommerce/providers/handlers.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/model/carousel/ListCarousel.dart' as listCarousel;
import '../../data/model/product/ListProduct.dart' as listProduct;

import 'components/carousel.dart';
import 'components/category.dart';
import 'components/item_product.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/img.png"),
        title: Text("Ecommerce"),
        flexibleSpace: Center(
          child: SizedBox(
            width: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TextButton(onPressed: () {}, child: Text("Home")),
                TextButton(onPressed: () {}, child: Text("Category")),
                TextButton(onPressed: () {}, child: Text("Feeds")),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Consumer<CarouselProvider>(
            builder: (context, carouselProvider, _) {
              return dataStateBuilder<List<listCarousel.Data>>(
                context,
                dataStateModel: carouselProvider.listCarouselModelState,
                onLoading: CarouselEcommerce(isLoading: true, data: [],),
                onSuccess: (val, msg) {
                  return CarouselEcommerce(data: val!,);
                },
              );
            },
          ),
          const SizedBox(height: 20),
          Text("Kategori Produk", style: Theme.of(context).textTheme.headlineSmall,),
          const SizedBox(height: 5),
          Category(),
          Consumer<ProductProvider>(
              builder: (context, productProvider,_){
                return dataStateBuilder<List<listProduct.Data>>(
                    context, 
                    dataStateModel: productProvider.listProductState,
                    onSuccess: (val, msg){
                      return ItemProduct(data: val!);
                    }
                );
              }
          )
        ],
      ),
    );
  }
}




