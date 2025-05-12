import 'package:environment/environment.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  final trackingNo;

  const DetailsScreen({super.key, required this.trackingNo});


  @override
  State<DetailsScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailsScreen> with WidgetsBindingObserver{
  BuildContext? mContext;
  final DetailController controller = Get.put(DetailController());


  @override
  void initState() {
    super.initState();
    controller.getDetailData(widget.trackingNo);
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
      Get.to(()=>DetailsScreen(trackingNo: widget.trackingNo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: GradientAppBar(title: 'Detail'.tr),
          ),
          body: GetBuilder<DetailController>(
              id: 'detail_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Container(
                      child: getData(context)
                    ),
                  ),
                );
              })),
    );
  }

  Widget getData(BuildContext context){
    if(controller.detailModel!=null){
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          appSizedBox(height: 20),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            color: ColorRes.blueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Details of Appeal ${controller.detailModel!.data!.appeal!.appealNo}/${controller.detailModel!.data!.appeal!.appealYear}",
                    style: styleW700S18.copyWith(color: ColorRes.white)),
              ],
            ),
          ),

          appSizedBox(height: 1.h),
          LabelValueRow1(
            label: "Appeal Type & Category",
            value:controller.detailModel!.data!.appeal!.appealType,
          ),

          appSizedBox(height: 1.h),

          LabelValueRow1(
            label: "Party Detail",
            value:"${controller.detailModel!.data!.appeal!.name} | ${controller.detailModel!.data!.appeal!.address} | ${controller.detailModel!.data!.appeal!.districtName}",
          ),

          appSizedBox(height: 1.h),


          LabelValueRow1(
            label: "District",
            value:
            controller.detailModel!.data!.appeal!.districtName,
          ),

          appSizedBox(height: 1.h),

          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            color: ColorRes.blueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Orders of Appeal ${controller.detailModel!.data!.appeal!.appealNo}/${controller.detailModel!.data!.appeal!.appealYear}", style: styleW700S18.copyWith(color: ColorRes.white)),
              ],
            ),
          ),


          getListData(context)
        ],
      );
    }else{
      return Column();
    }
  }

  Widget getListData( BuildContext context) {
    if (controller.data.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.data.length+1,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {



            if(index!=controller.data.length){

              DateTime? dd=null;
              DateTime? fudgeThis=null;

              if(controller.data[index].nextDate!=null){
                dd = DateFormat("yyyy-MM-dd hh:mm:ss").parse(controller.data[index].nextDate!);
              }
              if(controller.data[index].orderDate!=null){
                fudgeThis = DateFormat("yyyy-MM-dd hh:mm:ss").parse(controller.data[index].orderDate!);
              }
              String orderDate="-";
              if(fudgeThis!=null){
                orderDate = DateFormat("dd-MM-yyyy").format(fudgeThis);
              }

              String nextDate="-";
              if(dd!=null){
                nextDate = DateFormat("dd-MM-yyyy").format(dd);
              }



              return Padding(
                padding: const EdgeInsets.only(right: 5,left: 5,top: 10),
                child: Card(
                  elevation: 7,
                  child: InkWell(
                    onTap: (){
                      print(EndPoints.baseUrl+"/"+controller.data[index].uploadFile!);

                      makePhoneCall(EndPoints.baseUrl+"/"+controller.data[index].uploadFile!);
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
                            label: "Order Date",
                            value:
                            '${orderDate}',
                          ),
                          appSizedBox(height: 1.h),


                          LabelValueRow(
                            label: "Next Date",
                            value:
                            '${nextDate}',
                          ),

                          appSizedBox(height: 1.h),

                          LabelValueRow(
                            label: "Order Type",
                            value:index<controller.detailModel!.data!.interimOrders!.length ?
                            "Interim Order" : "Final Order",
                          ),

                          appSizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppButton(
                                buttonName: "Click here for Details",
                                buttonWidth: 150,
                                buttonHeight: 35,
                                fontSize: 12,
                                onButtonTap: (){

                                  makePhoneCall(EndPoints.baseUrl+"/"+controller.data[index].uploadFile!);
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
              );
            }


          });
    }else{
      return Container();
    }

  }


}


class LabelValueRow1 extends StatelessWidget {
  final String label;
  final String? value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? margin;
  final bool? isMedia;
  final String? url;

  const LabelValueRow1({
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


class TitleWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const TitleWidget({
    Key? key,
    this.title = '',
    this.backgroundColor = ColorRes.appBlueColor,
    this.textColor = Colors.white,
    this.height = 50.0,
    this.fontSize = 17.0,
    this.padding = const EdgeInsets.only(left: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: styleW700S18.copyWith(color: ColorRes.white)),
        ],
      ),
    );
  }
}