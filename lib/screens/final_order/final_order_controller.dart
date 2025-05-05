import 'package:environment/environment.dart';
import 'package:environment/model/final_order_list_model.dart';
import 'package:environment/screens/final_order/api/final_order_list_api.dart';

class FinalOrderController extends GetxController {
  bool loader = false;
  int recordFrom = 1;
  int recordTo = 3;
  String search = "";
  bool isMoreLoad=true;
  bool isSearch=false;
  bool isFirstPage=true;
  bool isLastPage=false;

  FinalOrderListData? finalOrderListData;
  List<FinalOrderListData> data=List.empty(growable: true);
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    getFinalOrderListData();
  }

  Future<void>  getFinalOrderListData() async{

    if(await isInternetAvailable(context)){
      FocusManager.instance.primaryFocus?.unfocus();
      loader = true;
      update(['final_order_screen']);

      print("ssss ${searchController.text.toString()}");
      try {

        FinalOrderListModel? model= isSearch == true ? await FinalOrderListApi.getFinalOrderListData(recordFrom.toString(),recordTo.toString(),searchController.text.toString()) :
        await FinalOrderListApi.getFinalOrderListData(recordFrom.toString(),recordTo.toString(),search);

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
      update(['final_order_screen']);
    }else{
      toastMsg("No Internet Available.");
    }
  }
}


