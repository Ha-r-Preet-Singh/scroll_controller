import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController mController;

  List<String> arrData = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
  ];

  @override
  void initState() {
    super.initState();
    mController = ScrollController()
      ..addListener(() {
        print(mController.offset);

        if (mController.position.pixels ==
            mController.position.maxScrollExtent) {
          print("End of List...");

          addNextPageData();
        }
      });
  }

  void addNextPageData() {
    List<String> arrData2 = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
    ];
    arrData.addAll(
      arrData2,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
          //   print("End of List");
          // }

          // if(notification is ScrollStartNotification){
          //     print("Scrolling Starting");
          // }else if(notification is ScrollUpdateNotification){
          //   print("Scrolling...");
          // }else if(notification is ScrollEndNotification){
          //   print("Scrolling Ended");
          //
          // }
          return false;
        },
        child: ListView.builder(
          controller: mController,
          itemCount: arrData.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text(
                  arrData[index],
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              margin: EdgeInsets.all(11),
            );
          },
        ),
      ),
    );
  }
}
