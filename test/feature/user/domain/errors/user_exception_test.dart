import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/user/data/errors/user_exception.dart';

void main() {
  group('UserException', () {
    test('Deve criar uma UserException com a mensagem correta', () {
      const message = 'Erro no repositório';

      final exception = UserException(message);

      expect(exception.message, message);
    });

    test(
        'Deve comparar UserExceptions com mensagens diferentes como diferentes',
        () {
      final exception1 = UserException('Erro no repositório');
      final exception2 = UserException('Outro erro');

      expect(exception1, isNot(exception2));
    });
  });
}
