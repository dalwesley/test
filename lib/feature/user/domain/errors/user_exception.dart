class UserException implements Exception {
  final String message;

  UserException(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
