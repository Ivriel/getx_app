import 'package:get/get.dart';
import 'package:getx_app/models/detail_data_model.dart';

class DataController extends GetxController {
     var data = DetailDataModel(
      name: "", 
      title: "", 
      text: "", 
      img: "", 
      time: "", 
      prize: ""
    );
    RxBool _isLoading = true.obs;
    
}