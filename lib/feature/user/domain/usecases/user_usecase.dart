import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';

abstract class UserUseCase {
  Future<Either<UserException, List<UserEntity>>> call({
    required String userID,
  });
}
