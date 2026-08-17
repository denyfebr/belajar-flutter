import 'package:ecommerce/data/repository/auth_repo.dart';
import 'package:ecommerce/utils/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/model/auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/auth/DetailUser.dart';
import 'handlers.dart';

class AuthProvider extends ChangeNotifier{
  DataStateModel<Login> _loginState = DataStateModel();
  DataStateModel<Login> get loginState => _loginState;

  DataStateModel _logoutState = DataStateModel();
  DataStateModel get logoutState => logoutState;

  DataStateModel <User> _detailUserState = DataStateModel();
  DataStateModel<User> get detailUserState => _detailUserState;

  bool _authStatus = false;
  bool get authStatus => _authStatus;

  AuthRepo authRepo = AuthRepo();

  final messaging = FirebaseMessaging.instance;

  updateFCMToken()async{
    final setting = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );

    if (setting.authorizationStatus == AuthorizationStatus.authorized){
      String? fcmToken = await messaging.getToken();
      if(fcmToken != null){
        String? tokenPref = await _getPref();
        await authRepo.updateFCMToken(tokenPref!, fcmToken);
        AppLogger.i("FCM Token : $fcmToken");
      }
    }
  }



  _saveToPref(String token)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();// mengambil shared preferences
    await prefs.setString("token", token);// memasukkan token ke shared preferences
  }

  Future<String?> _getPref()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('token')){
      throw Exception("No token found");
    }

    String? token = prefs.getString("token");

    return token;
  }

  Future isLoggedIn({bool needRefresh = false})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _authStatus = await prefs.containsKey('token');

    //String? token = prefs.getString("token");

    if(_authStatus){
      await updateFCMToken();
    }

    if(needRefresh) {
      notifyListeners();
    }
  }

  Future _deletePref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('token')){
      await prefs.remove("token");
      return;
    }
    throw Exception("No token found");
  }

  Future<void> login(String email, String password)async{
    _loginState.loading();
    notifyListeners();

    try{
      final response = await authRepo.login(email, password);
      _loginState.success(response, response.message!);
      await _saveToPref(_loginState.data!.token!.plainTextToken!); //masukkan token ke shared preferences
      await isLoggedIn();
      notifyListeners();
    }catch(err){
      _loginState.error("Terjadi kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }

  Future<void> detailUser()async{
    String? token = await _getPref();
    _detailUserState.loading();
    notifyListeners();
    try{
      final response = await authRepo.detailUser(token!);
      _detailUserState.success(response.user, response.message!);
      notifyListeners();
    }catch(err){
      _detailUserState.error("Terjadi kesalahan : ${err.toString()}");
      notifyListeners();
    }
  }

  Future<void> logout()async {
   _logoutState.loading();
   notifyListeners();
   try{
     String? token = await _getPref();
     final response = await authRepo.logout(token!);
     _logoutState.success(response, response);
     AppLogger.i("Clear login");
     _loginState.idle();
     AppLogger.i("Delete pref");
     await _deletePref();
     await isLoggedIn(); //cek apakah ada token
     notifyListeners();
     AppLogger.i("Logout success");
   }catch(err){
     AppLogger.e("Terjadi kesalahan : ${err.toString()}");
     _logoutState.error("Terjadi kesalahan : ${err.toString()}");
     notifyListeners();
   }
  }
}