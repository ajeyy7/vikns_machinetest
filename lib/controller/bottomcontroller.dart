import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeNavBar(int index) {
    selectedIndex.value = index;
  }
}
