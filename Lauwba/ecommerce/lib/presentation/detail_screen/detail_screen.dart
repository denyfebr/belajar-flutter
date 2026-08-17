import 'package:ecommerce/providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop.dart';
import 'mobile.dart';

class DetailScreen extends StatefulWidget {
  final int idProduct;
  const DetailScreen({super.key, required this.idProduct});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.getDetailProduct(widget.idProduct);
    return ResponsiveBuilder(
        builder: (context, sizeInfo) {
          if (sizeInfo.isMobile) {
            return MobileDetailScreen();
          } else if (sizeInfo.isTablet) {
            return DesktopDetailScreen();
          } else
            return DesktopDetailScreen();
          }

    );
  }
}
