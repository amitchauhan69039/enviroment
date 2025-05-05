import 'dart:math';

import 'package:environment/environment.dart';
import 'dart:convert';

import '../../utils/crypto_decrypt_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BuildContext? mContext;
  final SplashController controller = Get.put(SplashController());


  @override
  void initState() {
    super.initState();
    controller.navigatePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetRes.splash),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Centered logo
      
          ],
        ),
      ),
    );
  }
}


