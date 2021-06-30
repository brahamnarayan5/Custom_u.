import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapcont{
  
  static GoogleMapController cont;
  static void currentLocationFinder() async {
    Position locationData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    LatLng currentUserPosition =
        LatLng(locationData.latitude, locationData.longitude);

    CameraPosition currentCameraPosition =
        CameraPosition(target: currentUserPosition, zoom: 16);

    cont
        .animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition));

    // mapController.getLatLng(ScreenCoordinate(x:1 ,y:1 ));
  }
}