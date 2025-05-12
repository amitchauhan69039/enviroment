import 'package:environment/environment.dart';

class FinalOrderScreen extends StatefulWidget {
  const FinalOrderScreen({Key? key}) : super(key: key);


  @override
  State<FinalOrderScreen> createState() => _FinalOrderScreenState();
}

class _FinalOrderScreenState extends State<FinalOrderScreen> with WidgetsBindingObserver{
  BuildContext? mContext;
  final FinalOrderController controller = Get.put(FinalOrderController());


  @override
  void initState() {
    setState(() {
      controller.getFinalOrderListData();
    });

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Get.back();
      Get.to(()=>FinalOrderScreen());
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: GradientAppBar(title: 'Final Order'.tr,onBackTap: (){
              if(controller.recordFrom!=1){
                controller.recordFrom = controller.recordFrom-3;
                controller.recordTo = controller.recordTo-3;
                controller.getFinalOrderListData();
              }else{
                Navigator.pop(context);
              }

            }),
          ),
          body: GetBuilder<FinalOrderController>(
              id: 'final_order_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: InteractiveViewer(
                    panEnabled: false, // Set it to false to prevent panning.
                    boundaryMargin: EdgeInsets.all(double.infinity),
                    minScale: 0.5,
                    maxScale: 4,
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            appSizedBox(height: 10),
                            Container(
                                margin: EdgeInsets.only(left: 15,right: 15),
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 1,
                                      color: ColorRes.borderColor,
                                      style: BorderStyle.solid,
                                    ),
                                    color: ColorRes.white),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextField(
                                          keyboardType: TextInputType.text,
                                          controller: controller.searchController,
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          onChanged: (text) {},
                                          style: styleW400S13.copyWith(
                                              fontSize: 16,
                                              color: ColorRes.black),
                                          decoration:
                                          new InputDecoration.collapsed(
                                            hintText: 'Keyword Search',
                                            hintStyle:
                                            styleW400S13.copyWith(
                                                fontSize: 15,
                                                color:
                                                ColorRes.greyColor),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: (){
                                            controller.recordTo=3;
                                            controller.recordFrom=1;
                                            controller.isMoreLoad=true;
                                            if(controller.searchController.text.toString().isEmpty){
                                              controller.isSearch=false;
                                            }else{
                                              controller.isSearch=true;
                                            }

                                            controller.isFirstPage=true;
                                            controller.isLastPage=false;
                                            controller.data.clear();
                                            controller.getFinalOrderListData();
                                          },
                                          child: Image.asset(
                                            AssetRes.search,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    appSizedBox(width: 10),
                                  ],
                                )),
                    
                            appSizedBox(height: 10),
                            getListData(context),
                            appSizedBox(height: 30),
                    
                            Row(
                              mainAxisAlignment: controller.isFirstPage ? MainAxisAlignment.center : controller.isLastPage ? MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
                              children: [
                    
                                Visibility(
                                  visible: controller.isFirstPage ? false : true,
                                  child: Row(
                                    children: [
                                      appSizedBox(width: 15),
                                      AppButton(
                                        buttonName: "Previous",
                                        buttonWidth: 150,
                                        onButtonTap: (){
                    
                                          controller.recordFrom = controller.recordFrom-3;
                                          controller.recordTo = controller.recordTo-3;
                                          controller.getFinalOrderListData();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                    
                                Visibility(
                                  visible: controller.isLastPage ? false : true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppButton(
                                        buttonName: "Next",
                                        buttonWidth: 150,
                                        onButtonTap: (){
                                          controller.recordFrom = controller.recordTo+1;
                                          controller.recordTo = controller.recordTo+3;
                                          controller.getFinalOrderListData();
                                        },
                                      ),
                                      appSizedBox(width: 15),
                                    ],
                                  ),
                                ),
                    
                    
                    
                              ],
                            ),
                    
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetRes.sarkar_logo,
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Appellate Authority Under Water and Air Act",
                                            style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.appRedColor),
                                          ),
                                          Text(
                                            "Government of Haryana",
                                            style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: (){
                                      makePhoneCall("https://appeal.harenvironment.gov.in");
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AssetRes.web,
                                          height: 15,
                                          width: 15,
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Text(
                                            maxLines: 2,
                                            "https://appeal.harenvironment.gov.in",
                                            style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.appBlueColor,
                                                decoration: TextDecoration.underline,
                                                decorationColor: ColorRes.appBlueColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                    
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: (){
                                      final Uri googleMapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=${30.743684490687972},${76.78597123513326}');
                                      openMap(googleMapUrl);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AssetRes.map,
                                          height: 15,
                                          width: 15,
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Text(
                                            maxLines: 2,
                                            "Appellate Authority (HSPCB) Haryana,sco- 38-39,Sector-17A,Chandigarh",
                                            style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.appBlueColor,
                                                decoration: TextDecoration.underline,
                                                decorationColor: ColorRes.appBlueColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                    
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetRes.email,
                                        height: 15,
                                        width: 15,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "hspcb.appeal@gmail.com",
                                        style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    
                    
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }


  Widget getListData( BuildContext context) {

    if (controller.data.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.data.length,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
              child: Card(
                elevation: 7,
                child: InkWell(
                  onTap: (){
                    makePhoneCall(EndPoints.baseUrl+controller.data[index].filePath!);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index%2==0 ? ColorRes.white : ColorRes.homeBgColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                "Reg No./ year",
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.appbarDarkColor),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                "${controller.data[index].appealRegNo}/${controller.data[index].appealRegYear}",
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.black),
                              ),
                            )
                          ],
                        ),


                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                "Appealant",
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.appbarDarkColor),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                controller.data[index].appealant!,
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.black),
                              ),
                            )
                          ],
                        ),

                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                "Respondant",
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.appbarDarkColor),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                controller.data[index].respondant!,
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.black),
                              ),
                            )
                          ],
                        ),

                        appSizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                "Final Order Date",
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.appbarDarkColor),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child:  Text(
                                textAlign: TextAlign.start,
                                controller.data[index].finalOrderDate!,
                                style: styleW500S12.copyWith(fontSize: 22,
                                    color: ColorRes.black),
                              ),
                            )
                          ],
                        ),

                        appSizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppButton(
                              buttonName: "Click here for Details",
                              buttonWidth: 170,
                              buttonHeight: 40,
                              fontSize: 13,
                              onButtonTap: (){
                                makePhoneCall(EndPoints.baseUrl+controller.data[index].filePath!);
                              },
                            ),
                          ],
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            );

          });
    }else{
      return Container(
        height: 150,
        child: Center(
          child:  Text(
            textAlign: TextAlign.center,
            "No Data Found",
            style: styleW500S12.copyWith(fontSize: 13,
                color: ColorRes.black),
          ),
        ),
      );
    }

  }
}


