import 'package:custom_uber/AppPages/AppPage-1/GetControllers/MapPaddingController.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/PolyLineController.dart';
import 'package:custom_uber/AppPages/AppPage-1/GetControllers/mapcony.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

var icons = Icons.arrow_back;

class GoogleMapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapPaddingController>(builder: (controller) {
      return GetBuilder<PolylineController>(
          init: PolylineController(),
          builder: (controller2) {
            return GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              polylines: controller2.polyline,
              padding: EdgeInsets.only(
                  bottom: controller.bottomPadding, top: controller.toppadding),
              initialCameraPosition: CameraPosition(
                  target: LatLng(28.657954, 77.201038), zoom: 10),
              onMapCreated: (GoogleMapController controller) {
                // controller.setMapStyle();
                // Get.put(MapController(controller), permanent: true);
                try {
                  Mapcont.cont = controller;
                  Mapcont.currentLocationFinder();
                  // Get.find<MapController>().currentLocationFinder();
                  Get.find<MapPaddingController>().bpForStackItem0();
                } catch (e) {
                  print(
                      "unable to show your Location please turn on device location");
                }
              },
              // onCameraMove: userSelectingLocation == true
              //     ? (cameraPosition) {
              //         print(cameraPosition.target);
              //       }
              //     : null,
            );
          });
    });
  }
}
// // ignore: must_be_immutable
// class GoogleMapWidget extends StatefulWidget with ChangeNotifier {
//   GoogleMapWidget({Key key, this.completer}) : super(key: key);

//   Completer<GoogleMapController> completer;

//   @override
//   GoogleMapWidgetState createState() => GoogleMapWidgetState();
// }

// class GoogleMapWidgetState extends State<GoogleMapWidget> with ChangeNotifier {
//   GoogleMapWidgetState() : super();

//   bool userSelectingLocation = false;

//   void userSelctingLocation(bool value) {
//     userSelectingLocation = value;
//     notifyListeners();
//   }

//   GoogleMapController mapController;

//   getmapcontroller() async {
//     var mapcont = await widget.completer.future;
//     return mapcont;
//   }

//   // static Geolocator geolocator = Geolocator();

//   @override
//   Widget build(BuildContext context) {
//     // int indexofstack = 0;
//     double height = MediaQuery.of(context).size.height;
//     // double width = MediaQuery.of(context).size.width;
//     double paddingwhenindex1 = height * 0;
//     return GoogleMap(
//       zoomControlsEnabled: false,
//       rotateGesturesEnabled: false,
//       tiltGesturesEnabled: false,
//       initialCameraPosition: CameraPosition(target: LatLng(41, 42), zoom: 16),
//       myLocationButtonEnabled: false,
//       myLocationEnabled: true,
//       scrollGesturesEnabled: true,
//       padding: EdgeInsets.only(bottom: paddingwhenindex1),
//       onMapCreated: (GoogleMapController controller) {

//         // Get.put(MapController(controller),permanent: true);
//         widget.completer.complete(controller);
//         CurrentLocationGetterandSetter.currentLocationFinder(controller);

//       },
//       onCameraMove: (cameraPositon) {

//         if (userSelectingLocation) {
//           LatLng latlngAtCameraCenter = cameraPositon.target;
//           print(latlngAtCameraCenter);
//         }
//       },
//     );
//   }
// }
