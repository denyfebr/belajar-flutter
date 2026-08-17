import 'package:ecommerce/data/network_services.dart';

import '../model/cart/ListCart.dart';

class CartRepo extends NetworkServices{
  Future<ListCart> getListCart(String token)async{
    final response = await get("/cart", token: token);
    return ListCart.fromJson(response);
  }

  Future<String> addOrUpdateCart(String token, int productID, int qty)async {
    Map<String, dynamic> data = {
      "product_id" : productID.toString(),
      "quantity" : qty.toString()
    };
    final response = await post(
        "/cart", token: token, body: data);
    return response["message"];
  }

  Future<String> deleteCart(String token, int cartID)async {
    final response = await delete("/cart/$cartID", token: token);
    return response['message'];
  }


}