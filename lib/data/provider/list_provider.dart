import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_provider/data/service/list_service.dart';
import 'package:flutter_learn_provider/model/list_model.dart';
import 'package:flutter_learn_provider/utils/state.dart';

class ListProvider with ChangeNotifier {
  ListService service = ListService();
  List<ListModel>? listProduct = [];
  ResultState state = ResultState.noData;

  Future<void> getList() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      listProduct = await service.getListService();

      if (listProduct != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
