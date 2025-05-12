import 'package:environment/environment.dart';

import '../../model/cause_list_model.dart';
import 'api/cause_list_api.dart';

class CauseListController extends GetxController {
  bool loader = false;
  int recordFrom = 1;
  int recordTo = 6;
  String search = "";
  bool isMoreLoad=true;
  bool isSearch=false;
  bool isFirstPage=true;
  bool isLastPage=false;

  CauseListModel? causeListModel;
  List<CauseListData> data=List.empty(growable: true);
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    getCauseListData();
  }



    Future<void>  getCauseListData() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['cause_list_screen']);

      try {
        CauseListModel? model= isSearch == true ? await CauseListApi.getCauseListData(recordFrom.toString(),recordTo.toString(),searchController.text.toString()) :
        await CauseListApi.getCauseListData(recordFrom.toString(),recordTo.toString(),search);

        if(model!.status=="SUCCESS"){
          data.clear();
          if(recordFrom==1){
            isFirstPage=true;
          }else{
            isFirstPage=false;
          }
          print(" data ${model.data!.length} ");
          // if(model.data!.length==0 || model.data!.length<20){
          //   isMoreLoad=false;
          // }


          for(int i=0;i<model.data!.length;i++){
            data.add(model.data![i]);
          }


        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['cause_list_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }


  Future<void> onWillPop() async {

  }
}
