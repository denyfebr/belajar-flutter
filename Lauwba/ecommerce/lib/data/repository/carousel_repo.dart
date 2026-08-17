import 'package:ecommerce/data/model/carousel/ListCarousel.dart';
import 'package:ecommerce/data/network_services.dart';

class CarouselRepo extends NetworkServices{
  Future<ListCarousel> getAllCarousel()async{
    final response = await get("/carousel");
    return ListCarousel.fromJson(response);
  }
}