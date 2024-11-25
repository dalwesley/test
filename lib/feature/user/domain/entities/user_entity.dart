class UserEntity {
  final int id;
  final String name;
  final String email;
  final String avatar;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ avatar.hashCode;
}
