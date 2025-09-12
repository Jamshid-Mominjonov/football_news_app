import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_news_app/features/auth/domain/repositories/auth_repositories.dart';

import '../entities/sign_up_entity.dart';

class SignUpUseCase {
  AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<User?> call({required SignUpEntity signUpEntity}) {
    return authRepository.signUp(signUpEntity: signUpEntity);
  }
}