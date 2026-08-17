import 'package:ecommerce/data/model/product/ListProduct.dart' as listProductModel;
import 'package:ecommerce/data/model/product/DetailProduct.dart' as detailProductModel;
import 'package:ecommerce/providers/handlers.dart';
import 'package:ecommerce/data/repository/product_repo.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  ProductRepo productRepo = ProductRepo();
  DataStateModel<List<listProductModel.Data>> _listProductState = DataStateModel();
  DataStateModel<List<listProductModel.Data>> get listProductState => _listProductState;

  DataStateModel<detailProductModel.Data> _detailProductState = DataStateModel();
  DataStateModel<detailProductModel.Data> get detailProductState => _detailProductState;

  Future<void> getAllProduct() async {
    _listProductState.loading();
    notifyListeners();
    try{
      final response = await productRepo.getAllProduct();
      _listProductState.success(response.data, response.message!);
      notifyListeners();
    }catch(err){
      _listProductState.error("Terjadi kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }

  Future<void> getDetailProduct(int id) async {
    _detailProductState.loading();
    notifyListeners();
    try{
      final response = await productRepo.getDetailProduct(id);
      _detailProductState.success(response.data, response.message!);
      notifyListeners();
    }catch(err){
      _detailProductState.error("Terjadi kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }
}