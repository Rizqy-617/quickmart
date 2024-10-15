class User {
  int id;
  String firstName;
  String lastName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String birthDate;
  String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.birthDate,
    required this.image
  });

  static User init() {
    return User(
      id: 0,
      firstName: "",
      lastName: "",
      age: 0,
      gender: "",
      email: "",
      phone: "",
      username: "",
      birthDate: "",
      image: ""
    );
  }

  static User fromMap(Map? userMap) {
    try {
      return User(
        id: userMap?["id"],
        firstName: userMap?["firstName"] ?? "",
        lastName: userMap?["lastName"] ?? "",
        age: userMap?["age"] ?? 0,
        gender: userMap?["gender"] ?? "",
        email: userMap?["email"] ?? "",
        phone: userMap?["phone"] ?? "",
        username: userMap?["username"] ?? "",
        birthDate: userMap?["birthDate"] ?? "",
        image: userMap?["image"] ?? ""
      );
    } catch (e) {
      return User.init();
    }
  }
}