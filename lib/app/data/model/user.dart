class UserToken {
  String accessToken, idToken;

  UserToken({this.accessToken, this.idToken});

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      UserToken(accessToken: json['accessToken'], idToken: json['idToken']);

  Map<String, dynamic> toJson() =>
      {'accessToken': accessToken, 'idToken': idToken};
}
