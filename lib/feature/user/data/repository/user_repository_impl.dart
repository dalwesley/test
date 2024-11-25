import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/user/data/dataSource/user_datasource.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';
import 'package:flutter_application_1/feature/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;
  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;
  @override
  Future<Either<UserException, List<UserEntity>>> call(
      {required String userID}) async {
    try {
      final results = await _userDataSource.getUser(userID: userID);
      final userEntities = results.map((user) => user.toEntity()).toList();
      return Right(userEntities);
    } catch (e, s) {
      log('Erro no repositoryImpl', error: e, stackTrace: s);
      return Left(UserException(e.toString()));
    }
  }
}
