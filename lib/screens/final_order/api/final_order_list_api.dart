import 'package:environment/environment.dart';
import 'package:environment/model/cause_list_model.dart';
import 'package:environment/model/final_order_list_model.dart';
import 'package:http/http.dart' as http;

class FinalOrderListApi{

  static Future<FinalOrderListModel?> getFinalOrderListData(String record_from,String record_to,String search) async {
    String url=EndPoints.getFinalOrderList;
    Map<String,String> body={
      "record_from":record_from,
      "record_to":record_to,
      "keyword":search

    };

    try {
      final response = await HttpService.postApi(
          url: url,
          isContentType: true,
          body: body
      );
      print("final_order_list: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          FinalOrderListModel model = finalOrderListModelFromJson(responseBody);
          return model;
        } catch (e) {
          throw Exception("Unexpected response format: $responseBody  $e");
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }


}