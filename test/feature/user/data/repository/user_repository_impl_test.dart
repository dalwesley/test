import 'package:flutter_application_1/feature/user/data/models/user_model.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_application_1/feature/user/data/dataSource/user_datasource.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/data/repository/user_repository_impl.dart';

class MockUserDataSource extends Mock implements UserDataSource {}

void main() {
  late MockUserDataSource mockUserDataSource;
  late UserRepositoryImpl userRepository;

  setUp(() {
    mockUserDataSource = MockUserDataSource();
    userRepository = UserRepositoryImpl(userDataSource: mockUserDataSource);
  });

  group('UserRepositoryImpl', () {
    const userID = '123';
    final userModels = [
      UserModel(
        id: 1,
        name: 'name',
        email: 'email@email.com',
        avatar: 'avatar1.png',
      ),
      UserModel(
        id: 2,
        name: 'name2',
        email: 'email2@email.com',
        avatar: 'avatar2.png',
      ),
    ];

    final userEntities = userModels.map((user) => user.toEntity()).toList();

    test(
        'Deve retornar uma lista de UserEntity quando o dataSource retornar os dados corretamente',
        () async {
      when(() => mockUserDataSource.getUser(userID: userID))
          .thenAnswer((_) async => userModels);

      final result = await userRepository.call(userID: userID);

      result.fold(
        (error) => fail('Esperava um Right, mas recebeu um Left: $error'),
        (entities) => expect(entities, equals(userEntities)),
      );

      verify(() => mockUserDataSource.getUser(userID: userID)).called(1);
      verifyNoMoreInteractions(mockUserDataSource);
    });

    test('Deve retornar UserException quando o dataSource lançar uma exceção',
        () async {
      const exceptionMessage = 'Erro ao buscar usuário';
      when(() => mockUserDataSource.getUser(userID: userID))
          .thenThrow(Exception(exceptionMessage));

      final result = await userRepository.call(userID: userID);

      expect(result, isA<Left<UserException, List<UserEntity>>>());
      verify(() => mockUserDataSource.getUser(userID: userID)).called(1);
      verifyNoMoreInteractions(mockUserDataSource);
    });
  });
}
