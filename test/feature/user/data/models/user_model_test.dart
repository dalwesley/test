import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/user/data/models/user_model.dart';

void main() {
  group('UserModel', () {
    final userMap = {
      'id': 1,
      'name': 'name1',
      'email': 'email1@email.com',
      'avatar': 'avatar1.png',
    };

    final userModel = UserModel(
      id: 1,
      name: 'name1',
      email: 'email1@email.com',
      avatar: 'avatar1.png',
    );

    test('Deve criar uma UserModel corretamente a partir do construtor', () {
      final model = UserModel(
        id: 1,
        name: 'name1',
        email: 'email1@email.com',
        avatar: 'avatar1.png',
      );

      expect(model.id, 1);
      expect(model.name, 'name1');
      expect(model.email, 'email1@email.com');
      expect(model.avatar, 'avatar1.png');
    });

    test('Deve converter uma UserModel para um mapa corretamente', () {
      final map = userModel.toMap();

      expect(map, userMap);
    });

    test('Deve criar uma UserModel corretamente a partir de um mapa', () {
      final model = UserModel.fromMap(userMap);

      expect(model, userModel);
    });

    test('Deve lançar um erro ao criar uma UserModel com campos ausentes', () {
      final invalidMap = {
        'id': 1,
        'name': 'name1',
        'avatar': 'avatar1.png',
      };

      expect(
        () => UserModel.fromMap(invalidMap),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Deve converter uma UserModel para uma entidade corretamente', () {
      final entity = userModel.toEntity();

      expect(entity.id, userModel.id);
      expect(entity.name, userModel.name);
      expect(entity.email, userModel.email);
      expect(entity.avatar, userModel.avatar);
    });

    test('Deve retornar a string correta ao chamar toString', () {
      final result = userModel.toString();

      expect(result,
          'UserModel(id: 1, name: name1, email: email1@email.com, avatar: avatar1.png)');
    });

    test('Deve considerar duas instâncias iguais se seus campos forem iguais',
        () {
      final otherModel = UserModel(
        id: 1,
        name: 'name1',
        email: 'email1@email.com',
        avatar: 'avatar1.png',
      );

      expect(userModel, otherModel);
    });

    test('Deve gerar um hashCode consistente com os campos', () {
      final otherModel = UserModel(
        id: 1,
        name: 'name1',
        email: 'email1@email.com',
        avatar: 'avatar1.png',
      );

      expect(userModel.hashCode, otherModel.hashCode);
    });
  });
}
