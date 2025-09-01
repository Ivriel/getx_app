import 'package:get/get.dart';

class FavController extends GetxController {
  RxBool _fav = false.obs;
  bool get fav => _fav.value;
  set fav(bool val) => _fav.value = val; 

}