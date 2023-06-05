import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_provider/data/service/object_service.dart';
import 'package:flutter_learn_provider/model/object_model.dart';
import 'package:flutter_learn_provider/utils/state.dart';

class ObjectProvider with ChangeNotifier {
  ObjectService service = ObjectService();
  ObjectModel? model;
  ResultState state = ResultState.noData;

  Future<void> getObject() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      model = await service.getObjectModel();

      if (model == null) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
