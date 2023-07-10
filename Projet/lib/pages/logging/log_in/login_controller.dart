import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/routes/app_pages.dart';

import '../../../routes/app_routes.dart';
import '../../dashboard/dashboard_page.dart';

class LoginController extends GetxController {
  final LoginformKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var errorMessage = ''.obs;
  final box = GetStorage();

  void login() async {
    try {
      if (LoginformKey.currentState?.validate() ?? false) {
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();
        box.write('isAuthenticated', true);
        final isAuthenticated = box.read('isAuthenticated') ?? false;
        print('Is Authenticated: $isAuthenticated');
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          Get.offAndToNamed(AppRoutes.DASHBOARD); // Navigate to HomeScreen
        }
      }
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message!;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
