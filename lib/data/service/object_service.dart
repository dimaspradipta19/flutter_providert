import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_learn_provider/model/object_model.dart';

class ObjectService {
  Future<ObjectModel?> getObjectModel() async {
    try {
      Dio dio = Dio();
      const String url =
          "https://api.themoviedb.org/3/tv/top_rated?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US&page=1";

      var response = await dio.get(url);

      if (response.statusCode == 200) {
        return ObjectModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
