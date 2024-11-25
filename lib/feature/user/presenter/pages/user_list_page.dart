import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/user/presenter/pages/user_details_page.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: controller.fetchUsers,
          child: ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () => Get.to(() => UserDetailsPage(userEntity: user)),
              );
            },
          ),
        );
      }),
    );
  }
}
