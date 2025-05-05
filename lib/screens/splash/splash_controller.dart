import 'package:environment/environment.dart';

class SplashController extends GetxController {
  bool loader = false;


  Future<void> navigatePage() async {
      Future.delayed(const Duration(seconds: 3), () async {
        Get.offAll(()=> StartScreen());
      });
  }

}
