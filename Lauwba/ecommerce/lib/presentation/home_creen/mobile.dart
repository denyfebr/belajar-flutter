import 'package:ecommerce/presentation/home_creen/components/item_product.dart';
import 'package:ecommerce/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:ecommerce/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import '../../data/model/carousel/ListCarousel.dart' as listCarousel;
import '../../data/model/product/ListProduct.dart' as listProduct;
import '../../providers/carousel_provider.dart';
import '../../providers/handlers.dart';
import '../../providers/product_provider.dart';
import '../auth_screen/login_screen.dart';
import 'components/carousel.dart';
import 'components/category.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/img.png"),
        title: Text("E Commerce"),
        actions: [

          Consumer<AuthProvider>(
            builder: (context, auth, _) {

              if(auth.authStatus) {
                return IconButton.filled(
                    color: Colors.amberAccent,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserProfileScreen()));
                    },
                    icon: Icon(Icons.person)
                );
              }

              return IconButton.filled(
                color: Colors.amberAccent,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                }, icon: Icon(Icons.logout),
              );


            }
          )
        ],
      ),
      body: RefreshIndicator(
        // refresh list product dan list carousel
        onRefresh: () async{
          final product = Provider.of<ProductProvider>(context, listen: false);
          final carousel = Provider.of<CarouselProvider>(context, listen: false);
          product.getAllProduct();
          carousel.getAllCarousel();
          return;
        },
        child: ListView(
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
                      return ItemProduct(data: val);
                    }
                );
              }
            )
          ],
        ),
      ),
    );
  }
}