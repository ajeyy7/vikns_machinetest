import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';
import 'package:vikns_machinetest/view/pages/filterpage.dart';
import '../../controller/invoicecontroller.dart'; // Import the InvoiceController
import '../components/invoicetile.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final InvoiceController invoiceController = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Invoices",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (invoiceController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (invoiceController.salesData.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Divider(
                color: Colors.grey.shade900,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const FilterPage());
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: bluegrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_list_outlined,
                        color: Colors.blue,
                      ),
                      Text(
                        'Add Filter',
                        style: TextStyle(color: white),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade900,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: invoiceController.salesData.length,
                  itemBuilder: (context, index) {
                    final sale = invoiceController.salesData[index];
                    return Column(
                      children: [
                        Containerr(
                          customername: sale['CustomerName'],
                          status: sale['Status'],
                          invoiceno: sale['VoucherNo'].toString(),
                          amount: sale['TotalGrossAmt_rounded'].toString(),
                        ),
                        Divider(
                          color: Colors.grey.shade900,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
