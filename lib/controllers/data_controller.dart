import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/detail_data_model.dart';

class DataController extends GetxController {
     final _data = DetailDataModel(
      name: "", 
      title: "", 
      text: "", 
      img: "", 
      time: "", 
      prize: ""
    ).obs;
    get data => _data.value;
    final RxBool _isLoading = true.obs;
    bool get isLoading => _isLoading.value; // getter
    set isLoading(bool val) => _isLoading.value = val; // setter

    @override
    onInit(){
      super.onInit();
      loadJsonData();
      log("on init being called");
      log("on init loading value ${_isLoading.value}");
    }

    Future<void> loadJsonData() async {
      final String jsonString = await rootBundle.loadString('json/detail.json'); // buat ngeload data json (simulasi kaya call api get)
      final jsonData = jsonDecode(jsonString);
      _data.value = DetailDataModel.fromJson(jsonData);
    }

    @override
    void onClose(){
      super.onClose();
      log("onClose being called");
    }

}