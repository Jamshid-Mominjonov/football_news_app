import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:football_news_app/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:football_news_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:football_news_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:football_news_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:football_news_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:football_news_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_in/sign_in_notifier.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_in/sign_in_state.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_out/sign_out_notifier.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_out/sign_out_state.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_up/sign_up_notifier.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_up/sign_up_state.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref)=> FirebaseAuth.instance);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(firebaseAuth: ref.watch(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(authRemoteDataSource: ref.watch(authRemoteDataSourceProvider));
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(authRepository: ref.watch(authRepositoryProvider));
});

final signUpNotifierProvider = StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {
  return SignUpNotifier(signUpUseCase: ref.watch(signUpUseCaseProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(authRepository: ref.watch(authRepositoryProvider));
});

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  return SignInNotifier(signInUseCase: ref.watch(signInUseCaseProvider));
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(authRepository: ref.watch(authRepositoryProvider));
});

final signOutNotifierProvider = StateNotifierProvider<SignOutNotifier, SignOutState>((ref) {
  return SignOutNotifier(signOutUseCase: ref.watch(signOutUseCaseProvider));
});