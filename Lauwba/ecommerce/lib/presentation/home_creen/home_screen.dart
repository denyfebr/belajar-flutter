import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/carousel_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop.dart';
import 'mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getAllProduct();
    CarouselProvider carouselProvider = Provider.of<CarouselProvider>(context, listen: false);
    carouselProvider.getAllCarousel();
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.isLoggedIn(needRefresh: true);
    return ResponsiveBuilder(
      builder: (context, sizeInfo){
        if(sizeInfo.isMobile){
          return const MobileHomeScreen();
        }else if(sizeInfo.isDesktop){
          return const DesktopHomeScreen();
        }else{
          return const DesktopHomeScreen();
        }
      },
    );
  }
}






