import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String user;
  const UserModel({
    required this.id,
    required this.user,
  });



  UserModel copyWith({
    String? id,
    String? user,
  }) {
    return UserModel(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      user: map['user'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(id: $id, user: $user)';

  @override
  List<Object> get props => [id, user];
}
