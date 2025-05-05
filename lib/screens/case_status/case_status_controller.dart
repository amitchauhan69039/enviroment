import 'package:environment/environment.dart';
import 'package:environment/model/case_status_model.dart';
import 'package:environment/model/final_order_list_model.dart';
import 'package:environment/screens/case_status/api/case_status_api.dart';
import 'package:environment/screens/final_order/api/final_order_list_api.dart';

class CaseStatusController extends GetxController {
  bool loader = false;

  bool isSearch=false;

  CaseStatusModel? caseStatusModel;
  List<CaseStatusData> data=List.empty(growable: true);
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  Future<void>  getCaseStatusListData() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['case_status_screen']);

      try {

        CaseStatusModel? model=await CaseStatusApi.getCaseStatus(searchController.text.toString());
        print("datttttaa  ${model}");
        if(model!.status=="SUCCESS"){
          data.clear();

          for(int i=0;i<model.data!.length;i++){
            data.add(model.data![i]);
          }
          if(data.isNotEmpty){
            isSearch=true;
          }else{
            isSearch=false;
          }
        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['case_status_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}


