import 'package:get/get.dart';

class MapPaddingController extends GetxController {
  double screenHeight;
  double screenWidth;
  var bottomPadding = 0.0000;
  var toppadding = 0.00;
  double containerHeight = 0;
  // var sheet01OnScreen = false;

  MapPaddingController({this.screenHeight, this.screenWidth});

  void bpForStackItem0() {
    bottomPadding = (screenHeight * 0.15) + 10;
    // toppadding = (screenHeight * 0.71);
    update();
  }

  void bpForStackItem1() {
    // bottomPadding = (screenHeight * 0.7) +10;
    // toppadding = (screenHeight * 0.71);
    containerHeight = screenHeight * 0.25;
    update();
  }
}
