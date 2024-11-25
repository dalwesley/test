import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';
import 'package:flutter_application_1/feature/user/domain/repository/user_repository.dart';
import 'package:flutter_application_1/feature/user/domain/usecases/user_usecase.dart';

class UserUseCaseImpl implements UserUseCase {
  final UserRepository _userRepository;
  UserUseCaseImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<UserException, List<UserEntity>>> call({
    required String userID,
  }) async {
    try {
      return _userRepository.call(userID: userID);
    } catch (e, s) {
      log('Erro no useCase', error: e, stackTrace: s);
      return Left(UserException('Erro no useCase'));
    }
  }
}
