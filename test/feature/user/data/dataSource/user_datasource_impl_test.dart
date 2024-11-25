import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:mocktail/mocktail.dart';

import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';
import 'package:flutter_application_1/feature/user/data/models/user_model.dart';
import 'package:flutter_application_1/feature/user/data/dataSource/user_datasource_impl.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockDioClient mockDio;
  late UserDataSourceImpl userDataSource;

  setUp(() {
    mockDio = MockDioClient();
    userDataSource = UserDataSourceImpl(client: mockDio);
  });

  group('UserDataSourceImpl', () {
    const userID = '123';
    final userModels = [
      UserModel(
        id: 1,
        name: 'name1',
        email: 'email1@email1.com',
        avatar: 'avatar1.png',
      ),
      UserModel(
        id: 2,
        name: 'name2',
        email: 'email2@email.com',
        avatar: 'avatar2.png',
      ),
    ];

    final responseData = {
      'data': [
        {
          'id': 1,
          'name': 'name1',
          'email': 'email1@email1.com',
          'avatar': 'avatar1.png',
        },
        {
          'id': 2,
          'name': 'name2',
          'email': 'email2@email.com',
          'avatar': 'avatar2.png',
        }
      ]
    };

    test(
        'Deve retornar uma lista de UserModel quando a resposta for bem-sucedida',
        () async {
      when(() => mockDio.get('/api/users/$userID')).thenAnswer(
        (_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/api/users/$userID'),
        ),
      );

      final result = await userDataSource.getUser(userID: userID);

      expect(result, equals(userModels));
      verify(() => mockDio.get('/api/users/$userID')).called(1);
      verifyNoMoreInteractions(mockDio);
    });

    test('Deve lançar UserException quando a resposta não for bem-sucedida',
        () async {
      when(() => mockDio.get('/api/users/$userID')).thenAnswer(
        (_) async => Response(
          data: {},
          statusCode: 500,
          requestOptions: RequestOptions(path: '/api/users/$userID'),
        ),
      );

      expect(
        () => userDataSource.getUser(userID: userID),
        throwsA(isA<UserException>()),
      );
      verify(() => mockDio.get('/api/users/$userID')).called(1);
      verifyNoMoreInteractions(mockDio);
    });
  });
}
