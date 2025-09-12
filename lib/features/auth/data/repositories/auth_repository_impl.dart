import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_news_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:football_news_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:football_news_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:football_news_app/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<User?> signUp({required SignUpEntity signUpEntity}) {
    return authRemoteDataSource.signUp(signUpEntity: signUpEntity);
  }

  @override
  Future<User?> signIn({required SignInEntity signInEntity}) {
    return authRemoteDataSource.signIn(signInEntity: signInEntity);
  }

  @override
  Future<void> signOut() {
    return authRemoteDataSource.signOut();
  }
}