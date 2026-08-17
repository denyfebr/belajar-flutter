import 'package:ecommerce/data/repository/cart_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/cart/ListCart.dart' as listCartModel;
import 'handlers.dart';

class CartProvider extends ChangeNotifier{

  int _qty = 1;
  int get qty => _qty;

  void addQty(){
    _qty++;
    notifyListeners();
  }

  void minQty(){
    if(_qty > 1){
      _qty--;
    }
    notifyListeners();
  }

  setInit(){
    _qty = 1;
    notifyListeners();
  }

  DataStateModel<List<listCartModel.Data>> _listCartState = DataStateModel();
  DataStateModel<List<listCartModel.Data>> get listCartModelState => _listCartState;
  DataStateModel<String> _addOrUpdateCartState = DataStateModel();
  DataStateModel<String> get addOrUpdateCartModelState => _addOrUpdateCartState;

  DataStateModel<String> _deleteCartState = DataStateModel();
  DataStateModel<String> get deleteCartModelState => _deleteCartState;

    int setTotal(){
      if (_listCartState.isSuccess()) {
        int total = 0;
        return _listCartState.data!.fold(
          0,
              (sum, item) => sum + (item.products!.price!.toInt() * item.qty!.toInt()),
        );
      }
      return 0;
    }


  CartRepo cartRepo = CartRepo();

  _getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey("token")){
      return Exception("No Auth Key");
    }
    return prefs.getString("token");
  }

  Future getListCart() async {
    _listCartState.loading();
    notifyListeners();
    try {
      final response = await cartRepo.getListCart(await _getToken());
      _listCartState.success(response.data, response.message!);
      notifyListeners();
    }catch(err){
      _listCartState.error("Terjadi Kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }
//   update atau tambah item cart
  Future addOrUpdate(int idProduct, int quantity)async{
    _addOrUpdateCartState.loading();
    notifyListeners();
    try {
      final response = await cartRepo.addOrUpdateCart(await _getToken(), idProduct, quantity);
      _addOrUpdateCartState.success(null, response);
      notifyListeners();
    }catch(err){
      _addOrUpdateCartState.error("Terjadi Kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }

  Future delete(int idCart)async{
    _deleteCartState.loading();
    notifyListeners();
    try {
      final response = await cartRepo.deleteCart(await _getToken(),idCart);
      _deleteCartState.success(null, response);
      await getListCart();
    }catch(err){
      _deleteCartState.error("Terjadi Kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }
}