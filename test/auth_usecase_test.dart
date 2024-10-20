import 'package:flutter_test/flutter_test.dart';
import 'package:aladia_demo_app/auth/domain/entity/auth_entity.dart';

void main() {
  group('LogInEntity', () {
    test('should create a valid instance', () {
      // Arrange
      final logIn =
          LogInEntity(email: 'test@example.com', password: 'password123');

      // Act

      // Assert
      expect(logIn.email, 'test@example.com');
      expect(logIn.password, 'password123');
    });

    test('props should contain correct values', () {
      // Arrange
      final logIn =
          LogInEntity(email: 'test@example.com', password: 'password123');

      // Act
      final props = logIn.props;

      // Assert
      expect(props, ['test@example.com', 'password123']);
    });

    test('instances with same values should be equal', () {
      // Arrange
      final logIn1 =
          LogInEntity(email: 'test@example.com', password: 'password123');
      final logIn2 =
          LogInEntity(email: 'test@example.com', password: 'password123');

      // Act

      // Assert
      expect(logIn1, logIn2);
    });

    test('instances with different values should not be equal', () {
      // Arrange
      final logIn1 =
          LogInEntity(email: 'test@example.com', password: 'password123');
      final logIn2 =
          LogInEntity(email: 'test@example.com', password: 'differentPassword');

      // Act

      // Assert
      expect(logIn1, isNot(equals(logIn2)));
    });
  });

  group('VerifyEmailEntity', () {
    test('should create a valid instance', () {
      // Arrange
      final verifyEmail = VerifyEmailEntity(email: 'test@example.com');

      // Act

      // Assert
      expect(verifyEmail.email, 'test@example.com');
    });

    test('props should contain correct values', () {
      // Arrange
      final verifyEmail = VerifyEmailEntity(email: 'test@example.com');

      // Act
      final props = verifyEmail.props;

      // Assert
      expect(props, ['test@example.com']);
    });

    test('instances with same values should be equal', () {
      // Arrange
      final verifyEmail1 = VerifyEmailEntity(email: 'test@example.com');
      final verifyEmail2 = VerifyEmailEntity(email: 'test@example.com');

      // Act

      // Assert
      expect(verifyEmail1, verifyEmail2);
    });

    test('instances with different values should not be equal', () {
      // Arrange
      final verifyEmail1 = VerifyEmailEntity(email: 'test@example.com');
      final verifyEmail2 = VerifyEmailEntity(email: 'different@example.com');

      // Act

      // Assert
      expect(verifyEmail1, isNot(equals(verifyEmail2)));
    });
  });
}
