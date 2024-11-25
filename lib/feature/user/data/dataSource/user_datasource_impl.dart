import 'package:dio/dio.dart';
import 'package:flutter_application_1/feature/user/data/dataSource/user_datasource.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/data/models/user_model.dart';

class UserDataSourceImpl implements UserDataSource {
  final Dio _client;

  UserDataSourceImpl({
    required Dio client,
  }) : _client = client;

  @override
  Future<List<UserModel>> getUser({required String userID}) async {
    final response = await _client.get('/api/users/$userID');
    if (response.statusCode == 200) {
      final data = response.data['data'] as List;
      return data.map((json) => UserModel.fromMap(json)).toList();
    } else {
      throw UserException('Error fetching users');
    }
  }
}
