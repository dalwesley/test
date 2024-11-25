import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('id') ||
        !map.containsKey('name') ||
        !map.containsKey('email') ||
        !map.containsKey('avatar')) {
      throw ArgumentError('Faltam campos obrigatórios no mapa.');
    }

    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ avatar.hashCode;
  }
}
