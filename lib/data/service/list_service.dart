import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_learn_provider/model/list_model.dart';

class ListService {
  Future<List<ListModel>?> getListService() async {
    try {
      Dio dio = Dio();
      const String url = "https://api.escuelajs.co/api/v1/products?offset=10&limit=10";

      var response = await dio.get(url);

      if (response.statusCode == 200) {

        List<dynamic> responseData = response.data;
        List<ListModel> productList =
            responseData.map((json) => ListModel.fromJson(json)).toList();

        return productList;
      }
    } catch (e) {
      log("Error $e");
    }
    return null;
  }
}
