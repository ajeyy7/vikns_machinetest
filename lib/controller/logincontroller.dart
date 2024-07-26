import 'package:get/get.dart';
import '../services/services.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPassVisible = true.obs; 
  final Services services = Services();

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      await services.signin(
        username: username,
        password: password,
        loginController: this,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
