import 'package:dio/dio.dart';
import 'package:quickmart/utils/secure_storage.dart';

class Request {
  static Future<Map> request({
    String method = "POST", required String url, Map? postParam
  }) async {
    Response res;
    Map data = {};
    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 10000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    try {
      if (method == "GET") {
        res = await dio.get(url);
      } else {
        res = await dio.post(url, data: postParam ?? {});
      }
      data = res.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw("Timeout");
      } 
      if (e.type == DioExceptionType.connectionError) {
        throw("Internet error, please check your connection");
      }
    }

    return data;
  }

  static Future<Map> authorizeRequest({
    String method = "POST",
    required String url,
    Map? postParam,
    FormData? formData
  }) async {
    Response? res;
    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 10000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    Map? data;
    int reqNo = 0;
    postParam ??= {};
    String errorMessage = "";

    for (int i = 0; reqNo < 2; i++) {
      try {
        reqNo++;
        String? token = await SecureStorage.instance.getToken(CacheKey.accessToken);
        dio.options.headers = token == null || token == "" ? null : {"Authorization": "Bearer $token"};
        if (method == "GET") {
          res = await dio.get(url);
        } else {
          Map<String, dynamic> temp = {};
          if (formData == null) {
            res = await dio.post(url,
              data: (formData ?? postParam)
            );
          } else {
            for (MapEntry field in formData.fields) {
              temp[field.key] = field.value;
            }
            for (MapEntry file in formData.files) {
              temp[file.key] = file.value;
            }
            FormData? fd = FormData.fromMap(temp);
            res = await dio.post(
              url,
              data: fd
            );
          }
        }
      } on DioException catch(e) {
        if (e.response?.data["message"] == "Token Expired!") {
          await refreshLogin();
          continue;
        } else {
          if (e.type == DioExceptionType.connectionTimeout) {
            errorMessage = "Timeout";
          } 
          if (e.type == DioExceptionType.connectionError) {
            errorMessage = "Internet error, please check your connection";
          }
          // errorMessage = e.response?.data["message"];
        }
      }
      data = res?.data;
      break;
    }

    if (data != null && errorMessage.isEmpty) {
      return data;
    }

    throw Exception(errorMessage);
  }

  static Future<bool> refreshLogin() async {
    String? refreshToken = await SecureStorage.instance.getToken(CacheKey.refreshToken);
    Map data = {};
    if (refreshToken != null) {
      Response res;
      Dio dio = Dio();
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      dio.options.receiveTimeout = const Duration(milliseconds: 3000);
      res = await dio.post("https://dummyjson.com/auth/refresh", 
        data: {
          "refreshToken": refreshToken,
          "expiresInMins": 60
        },
      );

      data = res.data;

      if (data.containsKey("refreshToken")) {
        bool refreshToken = await SecureStorage.instance.updateToken(CacheKey.refreshToken, data["refreshToken"]);
        bool accessToken = await SecureStorage.instance.updateToken(CacheKey.accessToken, data["accessToken"]);
        if (refreshToken && accessToken) {
          return true;
        }
      }
    }
    throw "";
  }


}