class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String username;
  DateTime? createdAt;
  DateTime? deletedAt;
  int v;
  String role;

  User({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.username = '',
    this.createdAt,
    this.deletedAt,
    this.v = 0,
    this.role = '',
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      v: json['__v'] ?? 0,
      role: json['role'] ?? '',
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
      role: '',
    );
  }
}
