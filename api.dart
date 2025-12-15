import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/model/user.dart';

class API {
  String token = "";
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    var response = await dio.request(
      'https://fakestoreapi.com/products',
      // options: Options(method: 'GET'),
    );

    List<Product> ls = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((x) => Product.fromJson(x)).toList();
    } else {
      print(response.statusMessage);
    }
    return ls;
  }

  Future<String?> login(String username, String password) async {
    try {
      var dio = Dio();

      var response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {'username': username, 'password': password, 'expiresInMins': 30},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        token = response.data['accessToken'];
        return token;
      } else {
        print("Lỗi: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }

  Future<UserModel?> getProfile(String accessToken) async {
    try {
      var dio = Dio();

      var response = await dio.get(
        'https://dummyjson.com/auth/me',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        // convert JSON → UserModel
        return UserModel.fromJson(response.data);
      } else {
        print("Lỗi: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }

  void logout() {
    token = "";
    print("Đã logout → token = ''");
  }
}

var test_api = API();
