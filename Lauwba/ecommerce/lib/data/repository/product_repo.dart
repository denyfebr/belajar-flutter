import 'package:ecommerce/data/model/product/DetailProduct.dart';
import 'package:ecommerce/data/model/product/ListProduct.dart';
import 'package:ecommerce/data/network_services.dart';

class ProductRepo extends NetworkServices{
  Future<ListProduct> getAllProduct()async{
    final response = await get("/product");
    return ListProduct.fromJson(response);
  }

  Future<DetailProduct> getDetailProduct(int id)async{
    final response = await get("/product/$id");
    return DetailProduct.fromJson(response);
  }
}