import 'package:quickmart/models/review_model.dart';

class ProductModel {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discout;
  double rating;
  int stock;
  List tags;
  String brand;
  String warrantyInformation;
  String shippingInformation;
  List<ReviewModel> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  DateTime createdAt;
  DateTime updatedAt;
  String thumbnail;
  List images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discout,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.createdAt,
    required this.updatedAt,
    required this.thumbnail,
    required this.images
  });

  static ProductModel init() {
    return ProductModel(
      id: 0,
      title: "",
      description: "",
      category: "",
      price: 0.0,
      discout: 0.0,
      rating: 0.0,
      stock: 0,
      tags: [],
      brand: "",
      warrantyInformation: "",
      shippingInformation: "",
      reviews: [],
      returnPolicy: "",
      minimumOrderQuantity: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      thumbnail: "",
      images: []
    );
  }

  static ProductModel fromMap(Map data) {
    try {
      return ProductModel(
        id: data["id"],
        title: data["title"],
        description: data["description"],
        category: data["category"],
        price: data["price"],
        discout: data["discountPercentage"],
        rating: data["rating"],
        stock: data["stock"],
        tags: data["tags"],
        brand: data["brand"] ?? "",
        warrantyInformation: data["warrantyInformation"],
        shippingInformation: data["shippingInformation"],
        reviews: ReviewModel.loopArray(data["reviews"]),
        returnPolicy: data["returnPolicy"],
        minimumOrderQuantity: data["minimumOrderQuantity"],
        createdAt: DateTime.parse(data["meta"]["createdAt"]).toLocal(),
        updatedAt: DateTime.parse(data["meta"]["updatedAt"]).toLocal(),
        thumbnail: data["thumbnail"],
        images: data["images"]
      );
    } catch (e) {
      return ProductModel.init();
    }
  }
}