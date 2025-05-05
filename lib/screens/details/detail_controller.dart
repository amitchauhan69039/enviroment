import 'package:environment/environment.dart';
import 'package:environment/model/case_status_model.dart';
import 'package:environment/model/final_order_list_model.dart';
import 'package:environment/screens/case_status/api/case_status_api.dart';
import 'package:environment/screens/details/api/detail_api.dart';
import 'package:environment/screens/final_order/api/final_order_list_api.dart';

import '../../model/detail_model.dart';

class DetailController extends GetxController {
  bool loader = false;

  bool isSearch=false;

  DetailModel? detailModel;
  List<InterimOrders> data=List.empty(growable: true);
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  Future<void>  getDetailData(String trackingNo) async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['detail_screen']);

      try {

        DetailModel? model=await DetailApi.getdetailData(trackingNo);
        if(model!.status=="SUCCESS"){
          data.clear();

          detailModel=model;

          for(int i=0;i<model.data!.interimOrders!.length;i++){
            data.add(model.data!.interimOrders![i]);
          }

          for(int i=0;i<model.data!.finalOrders!.length;i++){
            data.add(model.data!.finalOrders![i]);
          }

        }
      } catch (e) {
        debugPrint("Unexpected response format: ${e.toString()}");
      }

      loader = false;
      update(['detail_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}


