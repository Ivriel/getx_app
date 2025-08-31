import 'package:get/get.dart';
import 'package:getx_app/views/content_page.dart';
import 'package:getx_app/views/my_detail_page.dart';
import 'package:getx_app/views/my_home_page.dart';

class RouteNames {

  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String detailPage = "/detail-page";
  static const String contentPage = "/content-page";

  static String getInitial()=> initial; // dikasih pake function gini soalnya biar lebih mudah reusablenya. misal mau ganti nama variabeljadi gausah ganti dibanyak tempat. cukup disini aja
  static String getHomePage()=> homePage;
  static String getDetailPage()=> detailPage;
  static String getContentPage()=> contentPage;

   static List<GetPage> routes = [
      GetPage(
          name: initial,  // sama kaya initial route (pertama kali dijalankan)
          page:()=> const MyHomePage()
        ),
        GetPage(
          name: contentPage, 
          page: ()=> const ContentPage()
        ),
        GetPage(
          name: detailPage, 
          page: ()=> const DetailPage()
        )
   ];
}