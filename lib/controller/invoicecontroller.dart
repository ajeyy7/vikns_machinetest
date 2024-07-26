import 'package:get/get.dart';
import 'package:vikns_machinetest/services/services.dart';

class InvoiceController extends GetxController {
  var salesData = <dynamic>[].obs;
  var isLoading = true.obs;
  final Services _services = Get.find(); // Find the Services instance registered with GetX

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<dynamic> data = await _services.fetchData();
      salesData.value = data;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
