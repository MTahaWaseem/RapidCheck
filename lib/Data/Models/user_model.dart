class UserModel {
  bool success;
  String message;
  String authToken;
  User user;

  UserModel({
    this.success = false,
    this.message = '',
    this.authToken = '',
    User? user,
  }) : user = user ?? User.empty();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'],
      message: json['message'],
      authToken: json['authToken'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String username;
  DateTime createdAt;
  DateTime? deletedAt;
  int v;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.createdAt,
    required this.deletedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      username: json['username'],
      createdAt: DateTime.parse(json['createdAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      v: json['__v'],
    );
  }

  factory User.empty() {
    return User(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      username: '',
      createdAt: DateTime.now(),
      deletedAt: null,
      v: 0,
    );
  }
}
