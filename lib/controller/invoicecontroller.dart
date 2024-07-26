import 'package:get/get.dart';
import 'package:vikns_machinetest/services/services.dart';

class InvoiceController extends GetxController {
  var salesData = <dynamic>[].obs;
  var isLoading = true.obs;
  final Services _services = Get.find(); // Find the Services instance registered with GetX

  @override
  void onInit() {
    super.onInit();
    fetchInvoices();
  }

 void fetchInvoices() async {
    try {
      isLoading(true);
      List<dynamic> data = await Services().fetchData();
      salesData.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch invoices");
    } finally {
      isLoading(false);
    }
  }
}
