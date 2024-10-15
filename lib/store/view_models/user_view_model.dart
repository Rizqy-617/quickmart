import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quickmart/models/user_model.dart';
import 'package:quickmart/models/user_token_model.dart';
import 'package:quickmart/store/action/action.dart';
import 'package:quickmart/store/reducers/reducer.dart';
import 'package:quickmart/store/reducers/user_reducer.dart';
import 'package:quickmart/utils/http.dart';
import 'package:quickmart/utils/secure_storage.dart';

class UserViewModel{
  UserViewModel._privateConstructor();
  static UserViewModel instance = UserViewModel._privateConstructor();

  Future<Map> login(String username, String password) async {
    Map data = await Request.authorizeRequest(
      method: "POST",
      url: "https://dummyjson.com/auth/login",
      postParam: {
        "username": username,
        "password": password,
        "expiresInMins": 60
      }
    );
    print(data);
    if (data.containsKey("accessToken") && data.containsKey("refreshToken")) {
      UserToken token = UserToken(
        refreshToken: data["accessToken"],
        accessToken: data["refreshToken"]
      );
      
      String json = jsonEncode(data);
      bool setUser = await setUserLogin(token, json);
      if (setUser) {
        return {"result": true};
      }
    }

    throw Exception(data["message"]);
  }

  Future<bool> setUserLogin(UserToken userToken, String userJson) async {
    try {
      bool refreshToken = await SecureStorage.instance.updateToken(CacheKey.refreshToken, userToken.refreshToken);
      bool accessToken = await SecureStorage.instance.updateToken(CacheKey.accessToken, userToken.accessToken);
      bool userData = await SecureStorage.instance.updateToken(CacheKey.userData, userJson);
      if (!refreshToken || !accessToken || !userData) {
        throw Exception("Unable to save data");
      }
      await refreshReduxStore();
      return true;
    } catch(err) {
      await SecureStorage.instance.storage.deleteAll();
      rethrow;
    }
  }

  Future<bool> hasToken() async {
    bool refreshToken = await SecureStorage.instance.getToken(CacheKey.refreshToken) != "";
    bool accessToken = await SecureStorage.instance.getToken(CacheKey.accessToken) != "";
    return accessToken && refreshToken;
  }

  Future<void> refreshUserData() async {
    try {
      Map data = await Request.authorizeRequest(
        url: "https://dummyjson.com/auth/me",
        method: "GET",
      );
      String jsonData = jsonEncode(data);
      print(jsonData);
      await SecureStorage.instance.updateToken(CacheKey.userData, jsonData);
      await refreshReduxStore();
    } on DioException catch (e) {
      print("--0-0-0-0-0-0-0-0-0-0");
      print(e.message);
    }
  }

  bool hasLogin() {
    return store!.state.user.id > 0;
  }

  Future<void> refreshReduxStore() async {
    Map? user = await getUserData();
    store?.dispatch(
      UserReducer(action: ActionOperation.setUser, payload: User.fromMap(user))
    );
  }

  Future<Map?> getUserData() async {
    String? userData = await SecureStorage.instance.readSecureData(CacheKey.userData);
    print(userData);
    if (userData != null && userData != "") {
      return jsonDecode(userData);
    }
    return null;
  }
}