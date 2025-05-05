import 'package:environment/environment.dart';
import 'package:environment/model/detail_model.dart';
import 'package:http/http.dart' as http;

class DetailApi{

  static Future<DetailModel?> getdetailData(String trackingNumber) async {
    String url=EndPoints.getCaseDetail;
    Map<String,String> body={
      "tracking_no":trackingNumber,

    };

    try {
      final response = await HttpService.getApi(
          url: url,
          isContentType: true,
          queryParams: body
      );
      print("detail_screen: ${response?.body}");

      if (response != null && response.statusCode == 200) {
        final responseBody = response.body;
        try {
          DetailModel model = detailModelFromJson(responseBody);
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