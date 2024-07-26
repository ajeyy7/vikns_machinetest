import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikns_machinetest/utils/colorconstants.dart';
import '../../controller/logincontroller.dart';
import '../components/button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() {
          if (loginController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 23, 19, 36),
                    Color.fromARGB(255, 31, 25, 52),
                    Color.fromARGB(255, 34, 34, 34),
                    Color.fromARGB(255, 31, 25, 52),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    ///translate
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.translate,
                            color: blue,
                          ),
                          Text(" English",
                              style: TextStyle(fontSize: 14, color: white))
                        ],
                      ),
                    ),

                    ///logintext
                    const SizedBox(height: 150),

                    const Column(
                      children: [
                        Text("Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 21,
                                color: white)),
                        Text("Login to your vikns account",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: lightgrey)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          ///textfileds
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: darkblue,
                                border: Border.all(color: bluegrey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: TextField(
                                    style: const TextStyle(
                                        color: white, fontSize: 13),
                                    controller: userController,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        label: Text('Username',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                color: lightgrey)),
                                        filled: true,
                                        fillColor: darkblue,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        ),
                                        border: OutlineInputBorder(),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                  ),
                                ),
                                const Divider(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Obx(() {
                                    return TextField(
                                      obscureText:
                                          loginController.isPassVisible.value,
                                      style: const TextStyle(
                                          color: white, fontSize: 13),
                                      controller: passController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          label: const Text('Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: lightgrey)),
                                          filled: true,
                                          fillColor: darkblue,
                                          prefixIcon: const Icon(
                                            Icons.key,
                                            color: Colors.blue,
                                          ),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                loginController
                                                        .isPassVisible.value =
                                                    !loginController
                                                        .isPassVisible.value;
                                              },
                                              icon: loginController
                                                      .isPassVisible.value
                                                  ? const Icon(
                                                      Icons.visibility_outlined,
                                                      color: Colors.blue,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .visibility_off_outlined,
                                                      color: Colors.blue,
                                                    )),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///forgotpassword
                    const Text("Forgotten Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.blue)),
                    const SizedBox(height: 20),

                    ///signinbutton
                    Button(
                      onTap: () {
                        if (userController.text.isNotEmpty &&
                            passController.text.isNotEmpty) {
                          loginController.login(userController.text.trim(),
                              passController.text.trim());
                        }
                      },
                    ),
                    const SizedBox(height: 100),

                    ///dont have an account
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Dont have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: lightgrey)),
                          Text("Sign up now!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
