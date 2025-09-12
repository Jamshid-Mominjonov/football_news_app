import 'package:football_news_app/features/auth/domain/repositories/auth_repositories.dart';

class SignOutUseCase {
  AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  Future<void> call() {
    return authRepository.signOut();
  }
}