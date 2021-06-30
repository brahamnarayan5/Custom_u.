import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  GoogleMapController mapController;

  MapController(this.mapController);

  void currentLocationFinder() async {
    Position locationData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    LatLng currentUserPosition =
        LatLng(locationData.latitude, locationData.longitude);

    CameraPosition currentCameraPosition =
        CameraPosition(target: currentUserPosition, zoom: 16);

    mapController
        .animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition));

    // mapController.getLatLng(ScreenCoordinate(x:1 ,y:1 ));
  }
}
