import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/routes/route_names.dart';
import 'views/content_page.dart';
import 'views/my_detail_page.dart';
import 'views/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/", // route yang pertama kali dijalankan
      // home: const MyHomePage(), // ini harus dihapus kalau mau pakai / initial route
      getPages: RouteNames.routes,
    );
  }
}
