import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/user/data/dataSource/user_datasource_impl.dart';
import 'package:flutter_application_1/feature/user/data/repository/user_repository_impl.dart';
import 'package:flutter_application_1/feature/user/domain/usecases/user_usecase_impl.dart';
import 'package:flutter_application_1/feature/user/presenter/controllers/user_controller.dart';
import 'package:flutter_application_1/feature/user/presenter/pages/user_list_page.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = UserDataSourceImpl(client: dio);
  final repository = UserRepositoryImpl(userDataSource: remoteDataSource);
  final userUseCase = UserUseCaseImpl(userRepository: repository);

  Get.put(UserController(usersUseCase: userUseCase));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: UserListPage(),
    );
  }
}
