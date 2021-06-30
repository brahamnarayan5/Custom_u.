import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineController extends GetxController {
  Set<Polyline> polyline = Set<Polyline>();

  void polylineGetter(List<LatLng> list) {
    polyline.clear();

    polyline.add(Polyline(
      polylineId: PolylineId("p1"),
      points: list,
    ));

    update();
  }

  void removePolyline() {
    polyline.clear();
    update();
  }
}
