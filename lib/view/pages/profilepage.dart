import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';
import 'package:vikns_machinetest/view/components/profiletile.dart';
import 'package:vikns_machinetest/view/pages/loginpage.dart';
import '../../controller/profilecontroller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if (profileController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (profileController.profileData.value == null) {
              return Center(
                child: Text(
                  profileController.errorMessage.value,
                  style: const TextStyle(color: white),
                ),
              );
            } else {
              final profileData = profileController.profileData.value!;
              return Column(
                children: [
                  const SizedBox(height: 15),
                  Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      profileData['customer_data']['photo']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${profileData['data']['first_name']} ${profileData['data']['last_name']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: white),
                                    ),
                                    Text(
                                      profileData['data']['email'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.edit_document,
                                  color: Colors.white,
                                  size: 35,
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: ProfileTile(
                                icon: Icons.scatter_plot_sharp,
                                heading: '4.3',
                                number: '221',
                                rs: 'rides',
                                color: Colors.indigo.shade100,
                                iconsm: Icons.star,
                              ),
                            ),
                            Flexible(
                              child: ProfileTile(
                                  iconsm: Icons.verified_outlined,
                                  icon: Icons.verified_outlined,
                                  heading: 'KYC',
                                  number: '',
                                  rs: 'Verified',
                                  color: Colors.green.shade100),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.clear();
                              Get.off(() => LoginPage());
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.logout, color: Colors.red),
                                  SizedBox(width: 10),
                                  Text('Logout',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: profileController.listTiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ListTile(
                            leading: Icon(
                              profileController.listTiles[index]['icon'],
                              color: white,
                            ),
                            title: Text(
                              profileController.listTiles[index]['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: white),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
