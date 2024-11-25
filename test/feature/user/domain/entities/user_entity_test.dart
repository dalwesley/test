import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    final user1 = UserEntity(
      id: 1,
      name: 'name1',
      email: 'email1@email.com',
      avatar: 'avatar1.png',
    );
    final user2 = UserEntity(
      id: 1,
      name: 'name1',
      email: 'email1@email.com',
      avatar: 'avatar1.png',
    );
    final user3 = UserEntity(
      id: 2,
      name: 'name2',
      email: 'email2@email.com',
      avatar: 'avatar2.png',
    );

    test('Deve ser igual quando id, name, email e avatar forem iguais', () {
      final result = user1 == user2;

      expect(result, true);
    });

    test('Deve ser diferente quando pelo menos um atributo for diferente', () {
      final result = user1 == user3;

      expect(result, false);
    });

    test('Deve gerar o mesmo hashCode para instâncias com os mesmos dados', () {
      final hashCode1 = user1.hashCode;
      final hashCode2 = user2.hashCode;

      expect(hashCode1, hashCode2);
    });

    test('Deve gerar hashCode diferente para instâncias com dados diferentes',
        () {
      final hashCode1 = user1.hashCode;
      final hashCode2 = user3.hashCode;

      expect(hashCode1, isNot(hashCode2));
    });
  });
}
