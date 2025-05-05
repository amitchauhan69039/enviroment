import 'package:environment/environment.dart';
import 'package:environment/model/case_status_model.dart';
import 'package:environment/model/cause_list_model.dart';
import 'package:environment/model/final_order_list_model.dart';
import 'package:http/http.dart' as http;

class CaseStatusApi{

  static Future<CaseStatusModel?> getCaseStatus(String search_type) async {
    String url=EndPoints.getCaseStatus;
    Map<String,String> body={
      "search_type":search_type,

    };

    try {
      final response = await HttpService.postApi(
          url: url,
          isContentType: true,
          body: body
      );
      print("case_status_list: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          CaseStatusModel model = caseStatusModelFromJson(responseBody);
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