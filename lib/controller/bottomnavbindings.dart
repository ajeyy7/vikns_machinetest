import 'package:get/get.dart';
import 'package:vikns_machinetest/controller/bottomcontroller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
