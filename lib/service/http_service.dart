import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:environment/environment.dart';

class HttpService {

  static Future<http.Response?> getApi({
    required String url,
    Map<String, String>? headers,
    bool skipHeader = false,
    bool isContentType = false,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (!skipHeader) {
        headers = headers ?? appHeader(isContentType: isContentType);
      }
      debugPrint("Url = $url");
      debugPrint("Headers = $headers");
      debugPrint("Query Params = $queryParams");

      // Construct the full URL with query parameters
      Uri uri = Uri.parse(url);
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http.get(uri, headers: headers);
      bool isExpired = await isTokenExpire(response);
      if (!isExpired) {
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<http.Response?> postApi2({
    required String url,
    Map<String, String>? headers,
    bool skipHeader = false,
    bool isContentType = false,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (!skipHeader) {
        headers = headers ?? appHeader(isContentType: isContentType);
      }
      debugPrint("Url = $url");
      debugPrint("Headers = $headers");
      debugPrint("Query Params = $queryParams");

      // Construct the full URL with query parameters
      Uri uri = Uri.parse(url);
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http.post(uri, headers: headers);
      bool isExpired = await isTokenExpire(response);
      if (!isExpired) {
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<http.Response?> postApii({
    required String url,
    Map<String, String>? header,
    dynamic body,
    bool isContentType = true,
  }) async {
    try {
      header = header ?? appHeader(isContentType: isContentType);
      debugPrint("Url = $url");
      debugPrint("Header = $header");
      debugPrint("Body = $body");

      if (body is Map) {
        body = jsonEncode(body);
      }
      final response = await http.post(Uri.parse(url), headers: header, body: body);
      bool isExpired = await isTokenExpire(response);
      if (!isExpired) {
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<http.Response?> postApi({
    required String url,
    Map<String, String>? header,
    Map<String, String>? body,
    bool isContentType = false,
  }) async {
    try {
      header = header ?? {};
      debugPrint("Url = $url");
      debugPrint("Header = $header");
      debugPrint("Body = $body");

      // Set Content-Type header to application/x-www-form-urlencoded
      header['Content-Type'] = 'application/x-www-form-urlencoded';

      // Encode the body as form data
      final encodedBody = body != null ? body.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&') : null;

      final response = await http.post(Uri.parse(url), headers: header, body: encodedBody);
      debugPrint("response = $response");
      print("respondddd  $response");
      return response;
    } catch (e) {
      print("respondddd err  $e");
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<http.Response?> postApiJavaToken({
    required String url,
    Map<String, String>? header,
    Map<String, String>? body,
    bool isContentType = false,
  }) async {
    try {
      header = header ?? {};
      debugPrint("Url = $url");
      debugPrint("Header = $header");
      debugPrint("Body = $body");
      // Set Content-Type header to application/x-www-form-urlencoded
      header['Content-Type'] = 'application/json';

      // Encode the body as form data
      final encodedBody = body != null ? body.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&') : null;

      final response = await http.post(Uri.parse(url), headers: header, body: encodedBody);
      debugPrint("response = $response");
      bool isExpired = await isTokenExpire(response);
      if (!isExpired) {
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }


  static Map<String, String> appHeader({bool isContentType = false}) {
    if (PrefService.getString(PrefKeys.accessToken).isEmpty) {
      return {
        if(isContentType)
          "Content-Type":"application/json"
      };
    } else {
      return {
        "token": PrefService.getString(PrefKeys.accessToken),
        if(isContentType)
          "Content-Type":"application/json"
      };
    }
  }

  static Future<bool> isTokenExpire(http.Response response) async {
    if (response.statusCode == 401) {
      await PrefService.set(PrefKeys.accessToken, "");
      await PrefService.set(PrefKeys.isLogin, false);
      //Get.offAll(() => LoginScreen());
      return true;
    } else {
      return false;
    }
  }

}
