import 'package:environment/environment.dart';
import 'package:environment/model/cause_list_model.dart';
import 'package:http/http.dart' as http;

class CauseListApi{

  static Future<CauseListModel?> getCauseListData(String record_from,String record_to,String search) async {
    String url=EndPoints.getCauseList;
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
      print("cause_list: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          CauseListModel model = causeListModelFromJson(responseBody);
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