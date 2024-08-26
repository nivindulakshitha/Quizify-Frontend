// Model to hold user data:nivindulakshitha
class UserModel {
  final String id;
  final String username;
  final String email;

  UserModel({required this.id, required this.email, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      email: json['email'],
      username: json['username'],
    );
  }
}