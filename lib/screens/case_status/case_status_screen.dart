import 'package:environment/environment.dart';

class CaseStatusScreen extends StatefulWidget {
  const CaseStatusScreen({Key? key}) : super(key: key);


  @override
  State<CaseStatusScreen> createState() => _CaseStatusScreenState();
}

class _CaseStatusScreenState extends State<CaseStatusScreen> with WidgetsBindingObserver{
  BuildContext? mContext;
  final CaseStatusController controller = Get.put(CaseStatusController());


  @override
  void initState() {
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
      Get.to(()=>CaseStatusScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: GradientAppBar(title: 'Case Status'.tr),
          ),
          body: GetBuilder<CaseStatusController>(
              id: 'case_status_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: controller.isSearch==false ?
                    Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Text(
                                  textAlign: TextAlign.start,
                                  "Appeal Number/Appellant Name/Advocate Name",
                                  style: styleW500S12.copyWith(fontSize: 20,
                                      color: ColorRes.black),
                                ),
                              ),

                              appSizedBox(height: 10),

                              Container(
                                margin: EdgeInsets.only(left: 20,right: 20),
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 1,
                                      color: ColorRes.borderColor,
                                      style: BorderStyle.solid,
                                    ),
                                    color: ColorRes.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      controller: controller.searchController,
                                      keyboardType: TextInputType.text,
                                      textAlignVertical: TextAlignVertical.center,
                                      onChanged: (text) {},
                                      style: styleW400S13.copyWith(
                                          fontSize: 16,
                                          color: ColorRes.black),
                                      decoration:
                                      new InputDecoration.collapsed(
                                        hintText: 'Appeal Number/Appellant Name/Advocate Name',
                                        hintStyle:
                                        styleW400S13.copyWith(
                                            fontSize: 15,
                                            color:
                                            ColorRes.greyColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              appSizedBox(height: 30),
                              Align(
                                alignment: Alignment.topCenter,
                                child: AppButton(
                                  buttonName: "Search",
                                  buttonWidth: 200,
                                  onButtonTap: (){
                                    controller.getCaseStatusListData();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),


                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                        ),
                      ],
                    ) :
                       getListData(context),
                    ),
                );
              })),
    );
  }


  Widget getListData( BuildContext context) {

    if (controller.data.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.data.length+1,
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {

            if(index!=controller.data.length){
              return Padding(
                padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                child: Card(
                  elevation: 7,
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>DetailsScreen(trackingNo:  controller.data[index].trackingNumber));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20,bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index%2==0 ? ColorRes.white : ColorRes.homeBgColor
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          LabelValueRow(
                            label: "Appeal Registration No.",
                            value:
                            '${controller.data[index].appealNo}',
                          ),
                          appSizedBox(height: 1.h),


                          LabelValueRow(
                            label: "Appeal Registration Year",
                            value:
                            '${controller.data[index].appealYear}',
                          ),

                          appSizedBox(height: 1.h),

                          LabelValueRow(
                            label: "Party Name",
                            value:
                            '${controller.data[index].unitName}',
                          ),

                          appSizedBox(height: 1.h),

                          LabelValueRow(
                            label: "Ground of Appeal",
                            value:
                            '${controller.data[index].appealType}',
                          ),

                          appSizedBox(height: 1.h),


                          LabelValueRow(
                            label: "Appeal Under Section",
                            value:
                            '${controller.data[index].appealSection}',
                          ),

                          appSizedBox(height: 1.h),

                          LabelValueRow(
                            label: "Category",
                            value:
                            '${controller.data[index].appealCategory}',
                          ),

                          appSizedBox(height: 1.h),

                          LabelValueRow(
                            label: "Advocate Name",
                            value:
                            '${controller.data[index].advocate_name}',
                          ),

                          appSizedBox(height: 1.h),

                          LabelValueRow(
                            label: "Status",
                            value:
                            '${controller.data[index].statusDesc}',
                          ),

                          appSizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppButton(
                                buttonName: "Click here for Details",
                                buttonWidth: 180,
                                buttonHeight: 40,
                                fontSize: 14,
                                onButtonTap: (){
                                  Get.to(()=>DetailsScreen(trackingNo:  controller.data[index].trackingNumber));
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
            }else{
              return Container(
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
                              style: styleW600S13.copyWith(fontSize: 8,color: ColorRes.appBlueColor,
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
              );
            }


          });
    }else{
      return Container();
    }

  }


}


class LabelValueRow extends StatelessWidget {
  final String label;
  final String? value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? margin;
  final bool? isMedia;
  final String? url;

  const LabelValueRow({
    Key? key,
    required this.label,
    this.value,
    this.labelStyle,
    this.valueStyle,
    this.isMedia = false,
    this.url = "",
    this.margin = const EdgeInsets.only(left: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isImage = false;
    if (isMedia == true) {
      // if (getUrlType(url!).toString() == "image") {
      //   isImage = true;
      // }
    }

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: margin,
            child: Text(
              (label == 'null') ? '-' : label ?? '-',
              style: labelStyle ?? styleW700S42.copyWith(color: ColorRes.appbarDarkColor,fontSize: 16),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(right: 16),
            child: isMedia!
                ? InkWell(
              onTap: () {
                // if (getUrlType(url!).toString() == "pdf") {
                //   launchURL("http://10.88.240.7/dev/${url!}");
                // } else if (getUrlType(url!).toString() == "image") {
                //   isImage = true;
                // }
              },
              child: Align(
                alignment: Alignment.topRight,
                child: isImage == true
                    ? Container(
                  height: 35,
                  width: 35,
                  child: CircleAvatar(
                    radius: 18, // Image radius
                    backgroundImage: NetworkImage(
                        'http://10.88.240.7/dev/${url!}'),
                  ),
                )
                    : url!.isEmpty == true || url == "null"
                    ? Text(
                  "Not Attached",
                  style: valueStyle ?? styleW400S14,
                )
                    : Image.asset(
                  AssetRes.pdf,
                  height: 25,
                  width: 25,
                ),
              ),
            )
                : Align(
              alignment: Alignment.centerRight,
              child: Text(
                (value == 'null') ? '-' : value ?? '-',
                style: valueStyle ?? styleW700S42.copyWith(color: ColorRes.black,fontSize: 14),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ],
    );
  }
}