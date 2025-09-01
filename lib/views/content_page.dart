import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/data_controller.dart';
import 'package:getx_app/routes/route_names.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  void loadingData(DataController controller) {
    Future.delayed(const Duration(seconds: 2), () {
      log("We are waiting for 2 seconds for loading");
      controller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DataController _controller = Get.put(DataController());
    log("_controller loading value 1 is ${_controller.isLoading}");
    loadingData(_controller);
    log("_controller loading value 2 is ${_controller.isLoading}");

    double width = MediaQuery.of(context).size.width;

    return Obx(() => _controller.isLoading
        ? const Scaffold(
            backgroundColor: Color(0xFFc5e5f3),
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFc5e5f3),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 10),
              color: const Color(0xFFc5e5f3),
              child: Column(
                children: [
                  //james smith
                  Container(
                    width: width,
                    height: 100,
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFebf8fd),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("img/background.jpg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_controller.dataList[3].name}",
                                style: TextStyle(
                                    color: Color(0xFF3b3f42),
                                    fontSize: 18,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Top Level",
                                style: TextStyle(
                                    color: Color(0xFFfdebb2),
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFf3fafc)),
                            child: Center(
                              child: Icon(
                                Icons.notifications,
                                color: Color(0xFF69c5df),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //popular contest
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Popular Contest",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Show all",
                          style: TextStyle(
                              color: Color(0xFFcfd5b3),
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFfdc33c)),
                          child: GestureDetector(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //list
                  Container(
                    height: 220,
                    child: PageView.builder(
                        controller: PageController(viewportFraction: 0.88),
                        itemCount: _controller.dataList.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              log("Tapped index (as id): $index");
                              Get.toNamed(
                                RouteNames.getDetailPage(index)
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              height: 220,
                              width: MediaQuery.of(context).size.width - 20,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: index.isEven
                                      ? Color(0xFF69c5df)
                                      : Color(0xFF9294cc)),
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        "${_controller.dataList[index].title}",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Expanded(child: Container())
                                    ],
                                  )),
                                  SizedBox(height: 10),
                                  Container(
                                    width: width,
                                    child: Text(
                                      "${_controller.dataList[index].text}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                  ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Container(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${_controller.dataList[index].img}"),
                                              fit: BoxFit.cover)),
                                    ),
                                  )
                                  ],
                                 )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //recent contests
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Recent Contests",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Show all",
                          style: TextStyle(
                              color: Color(0xFFcfd5b3),
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFfdc33c)),
                          child: GestureDetector(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _controller.dataList.length,
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap: (){
                                    Get.toNamed(RouteNames.getDetailPage(i));
                                  },
                                  child: Container(
                                    height: 100,
                                    margin: const EdgeInsets.only(
                                        left: 25, right: 25, bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xFFebf8fd),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage:
                                                AssetImage("${_controller.dataList[i].img}"),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Status",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color(0xFFfdebb2),
                                                      fontSize: 12,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  width: 130,
                                                  height: 50,
                                                  child: Text(
                                                    "${_controller.dataList[i].name}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Color(0xFF3b3f42),
                                                        fontSize: 18,
                                                        decoration:
                                                            TextDecoration.none),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: Text(
                                              "${_controller.dataList[i].time}", 
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.none,
                                                  color: Color(0xFFb2b8bb)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))),
                ],
              ),
            ),
          ));
  }
}
