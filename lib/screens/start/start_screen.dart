import 'dart:math';

import 'package:environment/environment.dart';
import 'dart:convert';

import '../../utils/crypto_decrypt_utils.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);


  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  BuildContext? mContext;
  final StartController controller = Get.put(StartController());


  @override
  void initState() {
    super.initState();

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
                  image: AssetImage(AssetRes.splash1),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: AppButton(
                    buttonName: "Get Started",
                    buttonWidth: 150,
                    backgroundColor: ColorRes.greenColor,
                    onButtonTap: (){
                      Get.to(()=>HomeScreen());
                    },
                  ),
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


