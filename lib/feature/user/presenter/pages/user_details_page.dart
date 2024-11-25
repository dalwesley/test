import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';

class UserDetailsPage extends StatelessWidget {
  final UserEntity userEntity;
  const UserDetailsPage({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userEntity.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundImage: NetworkImage(userEntity.avatar), radius: 50),
            const SizedBox(height: 20),
            Text(userEntity.name, style: const TextStyle(fontSize: 24)),
            Text(userEntity.email,
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
