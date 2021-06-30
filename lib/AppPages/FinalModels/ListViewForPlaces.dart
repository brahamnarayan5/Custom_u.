import 'package:custom_uber/AppPages/AppPage-1/GetControllers/SearchFieldController.dart';
import 'package:custom_uber/AppPages/FinalModels/ConstListViewer.dart';
import 'package:custom_uber/AppPages/FinalModels/PredictionTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListViewForPlaces(),
    ),
  ));
}

class ListViewForPlaces extends StatelessWidget {
  final SearchFieldController controller = Get.put(SearchFieldController());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.77,
      minChildSize: 0.1,
      maxChildSize: 0.78,
      builder: (context, scrollController) {
        return Container(
          // color: Colors.,
          // child: Column(children: [
          //   Container(
          //     height: 100,
          //     child: ConstListViewer()),
          // ],),
          child: ListView(padding: EdgeInsets.all(0),
              // controller:scrollController,
              children: [
                Container(height: 100, child: ConstListViewer()),
                Container(
                  height: 5,
                  color: Colors.grey[200],
                ),
                GetBuilder<SearchFieldController>(
                  builder: (controller) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(
                          padding: EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return (controller.finalPredictionsList.length > 0)
                                ? PredictionTile(
                                    controller.finalPredictionsList[index])
                                : Container(
                                    color: Colors.black,
                                  );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                                // height: 0,
                                // color: Colors.black,
                                thickness: 0.5,
                              ),
                          itemCount: controller.finalPredictionsList.length),
                    );
                  },
                )
              ]),
        );
      },
    );
  }
}
