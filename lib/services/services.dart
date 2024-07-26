import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikns_machinetest/controller/logincontroller.dart';

import '../view/pages/bottomnav.dart';

class Services extends GetxService {
  final String loginUrl =
      "https://api.accounts.vikncodes.com/api/v1/users/login";

  final String invoiceUrl =
      'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';
  Future<String> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    if (accessToken == null || accessToken.isEmpty) {
      throw Exception('Access token is not available');
    }
    return accessToken;
  }

  Future<void> signin({
    required String username,
    required String password,
    required LoginController loginController,
  }) async {
    try {
      final response = await http.post(Uri.parse(loginUrl), body: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        String accessToken = responseData['data']['access'];
        int userId = responseData['data']['user_id'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', accessToken);
        prefs.setInt('userid', userId);

        if (responseData.isNotEmpty) {
          Get.to(() => Bottom_Nav());
        }
      } else {
        Get.snackbar("Error", "Please valid credentials",
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            icon: const Icon(Icons.warning_amber));
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<List<dynamic>> fetchData() async {
    String accessToken = await _getAccessToken();
    final Map<String, dynamic> requestData = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": 62,
      "PriceRounding": 2,
      "page_no": 1,
      "items_per_page": 10,
      "type": "Sales",
      "WarehouseID": 1,
    };

    final response = await http.post(
      Uri.parse(invoiceUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['data'];
    } else {
      throw Exception('failed to load data');
    }
  }

  Future<Map<String, dynamic>> fetchProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken') ?? '';

    int userId = prefs.getInt('userid') ?? 0;

    final response = await http.get(
      Uri.parse(
          'https://www.api.viknbooks.com/api/v10/users/user-view/$userId/'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
