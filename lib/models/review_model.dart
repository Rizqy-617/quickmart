class ReviewModel {
  int rating;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail
  });

  static ReviewModel init() {
    return ReviewModel(
      rating: 0,
      comment: "",
      date: DateTime.now(),
      reviewerName: "",
      reviewerEmail: ""
    );
  }

  static List<ReviewModel> loopArray(List array) {
    List<ReviewModel> listReview = [];
    if (array.isEmpty) {
      return [];
    }
    for (int i = 0; i < array.length; i++) {
      ReviewModel reviemTemp = ReviewModel.fromMap(array[i]);
      listReview.add(reviemTemp);
    }
    return listReview;
  }

  static fromMap(Map data) {
    try {
      return ReviewModel(
        rating: data["rating"],
        comment: data["comment"],
        date: DateTime.parse(data["date"]).toLocal(),
        reviewerName: data["reviewerName"],
        reviewerEmail: data["reviewerEmail"]
      );
    } catch(e) {
      print(e.toString());
      return ReviewModel.init();
    }
  }
}