class CategoryModel {
  String slug;
  String name;
  String url;

  CategoryModel({
    required this.slug,
    required this.name,
    required this.url
  });

  static CategoryModel init() {
    return CategoryModel(
      slug: "",
      name: "",
      url: ""
    );
  }

  static CategoryModel fromMap(Map data) {
    try {
      return CategoryModel(
        slug: data["slug"],
        name: data["name"],
        url: data["url"]
      );
    } catch(e) {
      return CategoryModel.init();
    }
  }

  
}