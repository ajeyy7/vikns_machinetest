import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikns_machinetest/services/services.dart';

class ProfileController extends GetxController {
  final Services _services = Get.find();
  var profileData = Rxn<Map<String, dynamic>>();
  var isLoading = true.obs;
  var errorMessage = ''.obs;
final List<Map<String, dynamic>> listTiles = [
    {'icon': Icons.help, 'title': 'Help'},
    {'icon': Icons.youtube_searched_for_sharp, 'title': 'FAQ'},
    {'icon': Icons.group_add_outlined, 'title': 'Invite Friends'},
    {'icon': Icons.security_rounded, 'title': 'Terms of service'},
    {'icon': Icons.privacy_tip_outlined, 'title': 'Privacy Policy'},
  ];
  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      final data = await _services.fetchProfileData();
      profileData.value = data;
    } catch (e) {
      errorMessage.value = 'Failed to load profile data';
    } finally {
      isLoading.value = false;
    }
  }
}
