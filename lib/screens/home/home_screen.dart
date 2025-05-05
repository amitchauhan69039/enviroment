import 'dart:math';

import 'package:environment/environment.dart';
import 'dart:convert';

import '../../utils/crypto_decrypt_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext? mContext;
  final HomeController controller = Get.put(HomeController());


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<HomeController>(
              id: 'home_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetRes.bg_image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                appSizedBox(height: 20),

                                Row(
                                  children: [
                                    appSizedBox(width: 15),
                                    Image.asset(
                                      AssetRes.sarkar_logo,
                                      height: 80,
                                      width: 80,
                                    ),
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Appelatte Authority Under Water and Air Act",
                                            style: styleW600S13.copyWith(fontSize: 18,
                                                color: ColorRes.appRedColor),
                                          ),

                                          Text(
                                            textAlign: TextAlign.center,
                                            "Government of Haryana",
                                            style: styleW600S13.copyWith(fontSize: 16,
                                                color: ColorRes.white),
                                          ),
                                        ],
                                      )
                                    ),

                                    appSizedBox(width: 30)
                                  ],
                                ),
                                appSizedBox(height: 30),

                                Padding(
                            padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>CauseListScreen());
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 14,right: 14),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: ColorRes.homeBgColor,
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        appSizedBox(height: 10),


                                        Card(
                                          elevation: 10,
                                          shape: CircleBorder(
                                            side: BorderSide(color:ColorRes.white,
                                                width: 1),
                                          ),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorRes.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Image.asset(
                                                AssetRes.causelistIcon,
                                              ),
                                            ),
                                          ),
                                        ),

                                        appSizedBox(height: 5),
                                        Text(
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          "Cause List",
                                          style: styleW600S14.copyWith(fontSize: 22,
                                              color: ColorRes.black),
                                        ),
                                        appSizedBox(height: 10)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(()=>FinalOrderScreen());
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(left: 14,right: 14),
                                      child: Card(
                                        elevation: 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: ColorRes.homeBgColor,
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              appSizedBox(height: 10),
                                              Card(
                                                elevation: 10,
                                                shape: CircleBorder(
                                                  side: BorderSide(color:ColorRes.white,
                                                      width: 1),
                                                ),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: ColorRes.white,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Image.asset(
                                                      AssetRes.finalorderIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              appSizedBox(height: 5),
                                              Text(
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                "Final Orders",
                                                style: styleW600S14.copyWith(fontSize: 22,
                                                    color: ColorRes.black),
                                              ),
                                              appSizedBox(height: 10)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(()=>CaseStatusScreen());
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(left: 14,right: 14),
                                      child: Card(
                                        elevation: 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: ColorRes.homeBgColor,
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              appSizedBox(height: 10),
                                              Card(
                                                elevation: 10,
                                                shape: CircleBorder(
                                                  side: BorderSide(color:ColorRes.white,
                                                      width: 1),
                                                ),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: ColorRes.white,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Image.asset(
                                                      AssetRes.caseStatusIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              appSizedBox(height: 5),
                                              Text(
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                "Case Status",
                                                style: styleW600S14.copyWith(fontSize: 22,
                                                    color: ColorRes.black),
                                              ),
                                              appSizedBox(height: 10)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                appSizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}


