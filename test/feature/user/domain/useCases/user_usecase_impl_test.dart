import 'package:flutter_application_1/feature/user/domain/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/domain/entities/user_entity.dart';
import 'package:flutter_application_1/feature/user/domain/usecases/user_usecase_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockUserRepository;
  late UserUseCaseImpl userUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    userUseCase = UserUseCaseImpl(userRepository: mockUserRepository);
  });

  group('UserUseCaseImpl', () {
    const userID = '123';
    final users = [
      UserEntity(
        id: 1,
        name: 'name1',
        email: 'email1@email.com',
        avatar: 'avatar1',
      ),
      UserEntity(
        id: 2,
        name: 'name2',
        email: 'email2@email.com',
        avatar: 'avatar2',
      ),
    ];

    test(
        'Deve retornar uma lista de UserEntity quando o repositório for bem-sucedido',
        () async {
      when(() => mockUserRepository.call(userID: userID))
          .thenAnswer((_) async => Right(users));

      final result = await userUseCase.call(userID: userID);

      expect(result, Right(users));
      verify(() => mockUserRepository.call(userID: userID)).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });

    test('Deve retornar UserException quando o repositório lançar uma exceção',
        () async {
      when(() => mockUserRepository.call(userID: userID))
          .thenThrow(Exception('Erro no repositório'));

      final result = await userUseCase.call(userID: userID);

      expect(result, isA<Left<UserException, List<UserEntity>>>());
      verify(() => mockUserRepository.call(userID: userID)).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
