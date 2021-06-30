import 'package:custom_uber/AppPages/AppPage-1/GetControllers/MapPaddingController.dart';
import 'package:custom_uber/AppPages/AppPage-1/Models/CustomMyLocationButton.dart';
import 'package:custom_uber/AppPages/AppPage-1/Models/GoogleMapWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'IndexedStackPages.dart';

class Page01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    Get.put(MapPaddingController(
        screenHeight: screenHeight,
         screenWidth: screenWidth));

    return Stack(children: [
      GoogleMapWidget(),
      CustomMyLocationButton(),
      IndexedStackPages(),
    ]);
  }
}

// // var listofwidgets = [
// //     CustomMyLocationButton(),
// //   ];

// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   // CoustomMyLocationButton button = CoustomMyLocationButton();
//   Completer<GoogleMapController> completer = Completer();

//   // Future<void> getMapController() async {
//   //   GoogleMapController inmapController = await completer.future;

//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//                 flex: 10,
//                 child: Stack(children: [
//                   GoogleMapWidget(completer: completer,),
//                   CustomMyLocationButton(completer: completer,)

//                 ])),
//             Expanded(flex: 2, child: ContainerForNavigationToSearchPage()),
//           ],
//         )
//       ],
//     );
//   }
// }
