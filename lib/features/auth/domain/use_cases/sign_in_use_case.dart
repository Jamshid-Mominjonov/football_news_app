import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_news_app/features/auth/domain/repositories/auth_repositories.dart';

import '../entities/sign_in_entity.dart';

class SignInUseCase {
  AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<User?> call({required SignInEntity signInEntity}) {
    return authRepository.signIn(signInEntity: signInEntity);
  }
}