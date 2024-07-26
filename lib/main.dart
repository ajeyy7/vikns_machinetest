import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikns_machinetest/controller/bottomnavbindings.dart';
import 'package:vikns_machinetest/services/services.dart';
import 'package:vikns_machinetest/view/pages/bottomnav.dart';
import 'package:vikns_machinetest/view/pages/loginpage.dart';

import 'controller/invoicecontroller.dart';

void main() {
  Get.put(Services());
    Get.put(InvoiceController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> hasAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    return accessToken != null && accessToken.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BottomNavBinding(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: hasAccessToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!) {
            return Bottom_Nav();
          } else {
            return  LoginPage();
          }
        },
      ),
    );
  }
}
