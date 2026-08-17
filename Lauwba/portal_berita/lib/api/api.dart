import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portal_berita/api/ListBerita.dart';
import 'package:portal_berita/api/DetailBerita.dart';

const String baseUrl = "https://lauwba.com/webservices";
Duration timeout = Duration(seconds: 30);

class Api {
  static Future<ListBerita> getListBerita()async{
    try{
      var url = Uri.parse("$baseUrl/get_latest_news");
      var response = await http.get(url).timeout(timeout);
      if(response.statusCode >= 200 && response.statusCode <= 300){
        var json = jsonDecode(response.body);
        return ListBerita.fromJson(json);
      }
      throw Exception("Gagal mengambil data");
    }catch(ex){
      rethrow;
    }
  }

  static Future<DetailBerita> getDetailBerita(String id)async{
    try{
      var url = Uri.parse("$baseUrl/get_detail_news/$id");
      var response = await http.get(url).timeout(timeout);
      if(response.statusCode >= 200 && response.statusCode <= 300){
        var json = jsonDecode(response.body);
        return DetailBerita.fromJson(json);
      }
      throw Exception("Gagal mengambil data");
    }catch(ex){
      rethrow;
    }
  }

}