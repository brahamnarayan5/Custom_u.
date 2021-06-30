import 'package:get/get.dart';

class IndexedStackNavController extends GetxController {
  int index = 0;
  IndexedStackNavController();
  toIndexNo(int indexno) {
    index = indexno;
    update();
  }
}
