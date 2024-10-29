// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mutex/mutex.dart';

class CacheKey {
  static String refreshToken = "refreshToken";
  static String accessToken = "accessToken";
  static String userData = "userData";
  static String theme = "theme";
  static String latestProduct = "latestProduct";
  static String trendProduct = "trendProduct";
  static String fourCategories = "fourCategories";
  static String allCategories = "allCategories";
}

class SecureStorage {
  SecureStorage._privateConstructor();
  static final SecureStorage instance = SecureStorage._privateConstructor();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static Mutex mSync = Mutex();

  static Map<String, Mutex> mapMutex = {};

  static Mutex? getMutex(String key) {
    mSync.acquire();
    if (!mapMutex.containsKey(key)) {
      mapMutex[key] = Mutex();
    }
    mSync.release();
    return mapMutex[key];
  }

  static releaseAllMutex() {
    mSync.acquire();
    mapMutex.forEach((k, v) {
      v.release();
    });
    mSync.release();
  }

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readSecureData(String key) async {
    String value = await storage.read(key: key) ?? "";
    print("Data read from secure storage: $value");
    return value;
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  Future<bool> updateToken(String key, String param) async {
    try {
      await writeSecureData(key, param);
      return true;
    } catch (x) {
      print("UpdateToken error");
      print(x);
    } 
    return false;
  }

  Future<String?> getToken(String key) async {
    try {
      String? data = await readSecureData(key);
      return data;
    } catch(x) {
      print("getToken error");
      print(x);
    }
    return null;
  }

  Future<Map?> getMap(String keyName) async {
    Map json = {};
    try {
      String? data = await getToken(keyName);
      if (data == null || data == "") {
        return null;
      }
      json = jsonDecode(data);
      return json;
    } catch(e) {
      print("Secure Storage get map Error");
      print(e);
    }
    return null;
  }

  Future<bool> removeToken(String key) async {
    try {
      bool res = deleteSecureData(key);
      return res;
    } catch (x) {
      print("deleteToken error");
      print(x);
    } 
    return false;
  }

  Future<dynamic> getCache(
    String key, Function func, int refreshSeconds
  ) async {
    Map? tmp = {};
    Mutex? m = getMutex(key);
    dynamic result;
    await m?.acquire();
    try {
      tmp = await getMap(key);
      double last = tmp != null ? tmp["last"] : 0;
      double now = DateTime.now().millisecondsSinceEpoch / 1000;
      if (((now - last) > refreshSeconds && refreshSeconds > -1) || 
      tmp == null) {
        result = await func();
        Map data = {"last": now, "data": result};
        String encode = jsonEncode(data);
        await writeSecureData(key, encode);
      } else if (tmp.containsKey("data")) {
        print("masukk sini");
        result = tmp["data"];
      }
    } catch (x) {
      rethrow;
    } finally {
      m?.release();
    }
    return result;
  }

  
}