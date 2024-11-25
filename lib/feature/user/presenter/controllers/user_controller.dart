import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';
import 'package:flutter_application_1/feature/user/domain/usecases/user_usecase.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserUseCase _usersUseCase;

  UserController({required UserUseCase usersUseCase})
      : _usersUseCase = usersUseCase;

  final users = <UserEntity>[].obs;
  final isLoading = false.obs;

  Future<void> fetchUsers() async {
    isLoading.value = true;
    final result = await _usersUseCase(userID: 'userID');
    result.fold(
      (failure) => Get.snackbar('Error', 'Failed to fetch users'),
      (userList) => users.value = userList,
    );
    isLoading.value = false;
  }
}
