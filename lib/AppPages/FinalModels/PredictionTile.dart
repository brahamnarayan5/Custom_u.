import 'package:custom_uber/AppPages/AppPage-1/DataModels/Predictions.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/SearchFieldController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PredictionTile extends StatelessWidget {
  final Predictions prediction;
  PredictionTile(this.prediction);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Get.find<SearchFieldController>().saveSelectedPlaceDetails(
            placeID: prediction.placeId, index: prediction.index, typeindex: 1);
      },
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              // border: Border.(horizontal: BorderSide())
              ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.place_outlined,
                      size: 30,
                      color: Colors.black.withOpacity(0.6),
                    )),
              ),
              Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("${prediction.mainName}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17))),
                      Expanded(
                          flex: 1,
                          child: Text(
                            "${prediction.description}",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ))
            ],
          )),
    );
  }
}
