import 'package:flutter_application_1/feature/user/data/models/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUser({required String userID});
}
