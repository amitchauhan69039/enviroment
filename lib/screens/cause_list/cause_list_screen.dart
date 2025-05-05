import 'package:environment/environment.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:url_launcher/url_launcher.dart';

class CauseListScreen extends StatefulWidget {
  const CauseListScreen({Key? key}) : super(key: key);


  @override
  State<CauseListScreen> createState() => _CauseListScreenState();
}

class _CauseListScreenState extends State<CauseListScreen> {
  BuildContext? mContext;
  final CauseListController controller = Get.put(CauseListController());

  RefreshController refreshController=RefreshController(initialRefresh: true);


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: GradientAppBar(title: 'Cause List'.tr),
          ),
          body: GetBuilder<CauseListController>(
              id: 'cause_list_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child:InteractiveViewer(
                    panEnabled: false, // Set it to false to prevent panning.
                    boundaryMargin: EdgeInsets.all(double.infinity),
                    minScale: 1,
                    maxScale: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    appSizedBox(height: 15),
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
                                                  controller: controller.searchController,
                                                  keyboardType: TextInputType.text,
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
                                                    controller.recordTo=6;
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
                                                    controller.getCauseListData();
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

                                    appSizedBox(height: 30),

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

                                                  controller.recordFrom = controller.recordFrom-6;
                                                  controller.recordTo = controller.recordFrom+5;
                                                  controller.getCauseListData();
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
                                                  controller.recordTo = controller.recordTo+6;
                                                  controller.getCauseListData();
                                                },
                                              ),
                                              appSizedBox(width: 15),
                                            ],
                                          ),
                                        ),



                                      ],
                                    ),

                                    appSizedBox(height: 20),



                                  ],
                                ),
                              ),
                            ),
                          ),
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
                              Row(
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
                                      style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.black),
                                    ),
                                  ),
                                ],
                              ),


                              const SizedBox(height: 10),
                              Row(
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
                                      style: styleW600S13.copyWith(fontSize: 8, color: ColorRes.black),
                                    ),
                                  ),
                                ],
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
                );
              })),
    );
  }




  Widget getListData(BuildContext context) {
    final dataList = controller.data;

    if (dataList.isEmpty) {
      return SizedBox(
        height: 150,
        child: Center(
          child: Text(
            "No Data Found",
            textAlign: TextAlign.center,
            style: styleW500S12.copyWith(fontSize: 13, color: ColorRes.black),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 65.0,
        crossAxisSpacing: 7.0,
        mainAxisSpacing: 20.0,
      ),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final item = dataList[index];
        final listingDate = item.listing_date;

        String formattedDate = '';
        if (listingDate != null && listingDate.isNotEmpty) {
          try {
            final parsedDate = DateFormat("yyyy-MM-dd").parse(listingDate);
            formattedDate = DateFormat("dd-MM-yyyy").format(parsedDate);
          } catch (e) {
            formattedDate = 'Invalid date';
          }
        }

        final isHighlighted = index == 0 || index == 3 || index == 4;

        return InkWell(
          onTap: () {
            final filePath = item.file_path ?? '';
            if (filePath.isNotEmpty) {
              makePhoneCall(EndPoints.baseUrl + filePath);
            }
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: isHighlighted ? ColorRes.white : ColorRes.greyColor,
            child: Center(
              child: Text(
                formattedDate,
                textAlign: TextAlign.center,
                style: styleW600S15.copyWith(fontSize: 22, color: ColorRes.black, height: 1),
              ),
            ),
          ),
        );
      },
    );
  }

}


