import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';

import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<UserException, List<UserEntity>>> call(
      {required String userID});
}
