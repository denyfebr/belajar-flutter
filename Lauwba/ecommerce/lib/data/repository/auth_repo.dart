import 'package:ecommerce/data/network_services.dart';

import '../model/auth/DetailUser.dart';
import '../model/auth/Login.dart';

class AuthRepo extends NetworkServices{

  Future<Login> login(String email, String password)async{
    final Map<String, dynamic> data = {
      "email" : email,
      "password" : password
    };
    final response = await post("/auth", body: data);
    return Login.fromJson(response);
  }

  Future<DetailUser> detailUser(String token)async{
    final response = await get("/auth/detail", token: token);
    return DetailUser.fromJson(response);
  }

  Future<Map<String, dynamic>> register(String token, String name, String email, String password, String retypePassword)async{
    final Map<String, dynamic> data = {
      "name" : name,
      "email" : email,
      "password" : password,
      "password_confirmation" : retypePassword,
    };
    final response = await post("/auth/register", body: data);
    return response;
  }

  Future<String> logout(String token)async{
    final response = await get("/auth/logout", token: token);
    return response['message'];
  }

  Future<String> updateFCMToken(String token, String fcmToken)async{
    final Map<String, dynamic> data = {
      "token": fcmToken,
    };
    final response = await put('/auth/fcm-token',body: data, token: token);
    return response['message'];
  }

}