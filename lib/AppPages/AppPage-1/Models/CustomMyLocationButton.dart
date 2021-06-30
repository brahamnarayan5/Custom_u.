import 'package:custom_uber/AppPages/AppPage-1/GetControllers/MapPaddingController.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/mapcony.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMyLocationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GetBuilder<MapPaddingController>(builder: (controller) {
        return GestureDetector(
          onTap: () {
            Mapcont.currentLocationFinder();
            // Get.find<MapController>().currentLocationFinder();
          },
          child: Padding(
            padding:
                EdgeInsets.only(bottom: controller.bottomPadding, right: 5),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 2)
                  ]),
              child: Icon(
                Icons.my_location,
                size: 35,
                color: Colors.blue[900],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// class CustomMyLocationButton extends StatefulWidget {
//   CustomMyLocationButton({Key key, this.completer}) : super(key: key);
//   final Completer<GoogleMapController> completer;

//   @override
//   _CustomMyLocationButtonState createState() => _CustomMyLocationButtonState();
// }

// class _CustomMyLocationButtonState extends State<CustomMyLocationButton> {
//   GoogleMapController mapController;

//   Future<void> getMapController() async {
//     GoogleMapController inmapController = await widget.completer.future;
//     setState(() {
//       mapController = inmapController;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomRight,
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 5, right: 5),
//         child: GestureDetector(
//           onTap: () {
//             //  Provider.of<GoogleMapWidgetState>(context, listen: false).getmapcontroller();

//             Get.find < MapController>().currentLocationFinder();

//             // getMapController();

//             // if (mapController != null) {
//             //   CurrentLocationGetterandSetter.currentLocationFinder(
//             //       mapController);
//             // } else {
//             //   print("try Again when the map is loaded");
//             // }
//           },
//           child: Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(50),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.4),
//                       spreadRadius: 2,
//                       blurRadius: 2)
//                 ]),
//             child: Icon(
//               Icons.my_location,
//               size: 35,
//               color: Colors.blue[900],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
