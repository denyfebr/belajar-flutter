import 'package:ecommerce/data/model/carousel/ListCarousel.dart' as listCarouselModel;
import 'package:ecommerce/data/repository/carousel_repo.dart';
import 'package:ecommerce/providers/handlers.dart';
import 'package:flutter/material.dart';

class CarouselProvider extends ChangeNotifier{
  CarouselRepo carouselRepo = CarouselRepo();
  DataStateModel<List<listCarouselModel.Data>> _listCarouselState = DataStateModel();
  DataStateModel<List<listCarouselModel.Data>> get listCarouselModelState => _listCarouselState;

  Future<void> getAllCarousel() async {
    _listCarouselState.loading();
    notifyListeners();
    try{
      final response = await carouselRepo.getAllCarousel();
      _listCarouselState.success(response.data, response.message!);
      notifyListeners();
    }catch(err){
      _listCarouselState.error("Terjadi kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }

}