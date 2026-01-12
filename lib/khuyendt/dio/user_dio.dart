// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDio {
  final int id;
  final String name;
  final String username;
  final String email;
  UserDio({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  UserDio copyWith({int? id, String? name, String? username, String? email}) {
    return UserDio(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
    };
  }

  factory UserDio.fromJson(Map<String, dynamic> map) {
    return UserDio(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
    );
  }
}
