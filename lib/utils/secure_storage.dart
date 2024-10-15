// ignore_for_file: avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheKey {
  static String refreshToken = "refreshToken";
  static String accessToken = "accessToken";
  static String userData = "userData";
  static String theme = "theme";
}

class SecureStorage {
  SecureStorage._privateConstructor();
  static final SecureStorage instance = SecureStorage._privateConstructor();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

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

  
}