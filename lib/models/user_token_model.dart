class UserToken {
  String accessToken;
  String refreshToken;

  UserToken({
    required this.accessToken,
    required this.refreshToken
  });

  static UserToken init() {
    return UserToken(
      accessToken: "",
      refreshToken: ""
    );
  }

  static UserToken fromMap(Map map) {
    try {
      return UserToken(
        accessToken: map["accessToken"],
        refreshToken: map["refreshToken"]
      );
    } catch (e) {
      return UserToken.init();
    }
  }
}