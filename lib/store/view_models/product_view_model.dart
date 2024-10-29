import 'package:quickmart/models/category_model.dart';
import 'package:quickmart/models/product_model.dart';
import 'package:quickmart/utils/http.dart';
import 'package:quickmart/utils/secure_storage.dart';

class ProductViewModel {
  ProductViewModel._privateConstructor();
  static ProductViewModel instance = ProductViewModel._privateConstructor();

  Future<List<ProductModel>> getTrendDiscountProduct({
    String sortBy = "discountPercentage",
    String order = "desc",
    int limit = 5,
    bool clearCache = true
  }) async {
    List<ProductModel> listProduct = [];
    try {
      List data = await SecureStorage.instance.getCache(CacheKey.trendProduct, () async {
        Map result = await Request.request(
          url: "https://dummyjson.com/products",
          method: "GET",
          query: {
            "sortBy": sortBy,
            "order": order,
            "limit": limit
          }
        );
        
        List data = result["products"];
        if (data.isNotEmpty) {
          return data;
        } else {
          return [];
        }
      }, 3600);
      if (data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          ProductModel productTemp = ProductModel.fromMap(data[i]);
          listProduct.add(productTemp);
        } 
        return listProduct;
      } else {
        return [];
      }
    }  catch (e, stack) {
      print(e.toString());
      print("111111");
      print(stack);
      return [];
    }
  }

  Future<List<ProductModel>> getLatestProduct({
    String sortBy = "id",
    String order = "desc",
    int limit = 10,
    bool clearCache = true
  }) async {
    List<ProductModel> listProduct = [];
    try {
      List data = await SecureStorage.instance.getCache(CacheKey.latestProduct, () async {
        Map result = await Request.request(
          url: "https://dummyjson.com/products",
          method: "GET",
          query: {
            "sortBy": sortBy,
            "order": order,
            "limit": limit
          }
        );
        
        List data = result["products"];
        if (data.isNotEmpty) {
          return data;
        } else {
          return [];
        }
      }, 3600);
      if (data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          ProductModel productTemp = ProductModel.fromMap(data[i]);
          listProduct.add(productTemp);
        }
        return listProduct;
      } else {
        return [];
      }
    }  catch (e, stack) {
      print(e.toString());
      print("22222");
      print(stack);
      return [];
    }
  }

  Future<List<CategoryModel>> getAllCategories({bool clearCache = true}) async {
    if (clearCache) {
      SecureStorage.instance.deleteSecureData(CacheKey.allCategories);
    }
    try {
      List data = await SecureStorage.instance.getCache(CacheKey.allCategories, () async {
        List result = await Request.request(
          url: "https://dummyjson.com/products/categories",
          method: "GET"
        );

        if (result.isNotEmpty) {
          return result;
        } else {
          return [];
        }
      }, 3600);
      if (data.isNotEmpty) {
        List<CategoryModel> listTemp = [];
        for (int i = 0; i < data.length; i++) {
          CategoryModel temp = CategoryModel.fromMap(data[i]);
          listTemp.add(temp);
        }
        return listTemp;
      } else {
        return [];
      }
    } catch(e, stack) {
      print(e.toString());
      print("33333");
      print(stack);
      return [];
    }
  }

  Future<List<CategoryModel>> getFourCategories({bool clearCache = true}) async {
    if (clearCache) {
      SecureStorage.instance.deleteSecureData(CacheKey.fourCategories);
    }
    try {
      List data = await SecureStorage.instance.getCache(CacheKey.fourCategories, () async {
        List result = await Request.request(
          url: "https://dummyjson.com/products/categories",
          method: "GET"
        );

        if (result.isNotEmpty) {
          return result;
        } else {
          return [];
        }
      }, 3600);

      if (data.isNotEmpty) {
        List<CategoryModel> listTemp = [];
        for (int i = 0; i < 4; i++) {
          CategoryModel temp = CategoryModel.fromMap(data[i]);
          listTemp.add(temp);
        }
        return listTemp;
      } else {
        return [];
      }
    } catch(e) {
      return [];
    }
  }
}