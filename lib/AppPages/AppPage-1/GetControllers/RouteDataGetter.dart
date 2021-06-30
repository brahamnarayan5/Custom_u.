import 'package:custom_uber/AppPages/AppPage-1/DataModels/RouteDataModel.dart';
import 'package:custom_uber/AppPages/AppPage-1/DataModels/mapsKey.dart';
import 'package:custom_uber/AppPages/AppPage-1/HelperMethods/HttpRequestHelper.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteDataGetter {
  static Future<RouteDataModel> routeWithBothLatLng(
      LatLng pickupPoint, LatLng destinationPoint) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${pickupPoint.latitude},${pickupPoint.longitude}&destination=${destinationPoint.latitude},${destinationPoint.longitude}&key=$mapKey";

    return urlRequestandData(url);
  }

  static Future<RouteDataModel> routeWithBothPlaceID(
      String pickupID, String destinationID) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$pickupID&destination=$destinationID&key=$mapKey";

    return urlRequestandData(url);
  }

  static Future<RouteDataModel> routeWithLatLngAndPlaceID(
      LatLng pickupPoint, String destinationID) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${pickupPoint.latitude},${pickupPoint.longitude}&destination=$destinationID&key=$mapKey";

    return urlRequestandData(url);
  }

  static routeWithPlaceIDAndLatLng(
      String pickupID, LatLng destinationPoint) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$pickupID&destination=${destinationPoint.latitude},${destinationPoint.longitude}&key=$mapKey";

    return urlRequestandData(url);
  }

  static Future<RouteDataModel> urlRequestandData(String url) async {
    var response = await HttpRequestHelper.getRequestHelper(url);

    RouteDataModel routeData = RouteDataModel.fromJson(response);

    return routeData;
  }

  static polylineDecoder(RouteDataModel routeData) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result =
        polylinePoints.decodePolyline(routeData.encodedPoints);
    List<LatLng> latLngresult = result.map((e) {
      return LatLng(e.latitude, e.longitude);
    });
    return latLngresult;
    
  }
}
