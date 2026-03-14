import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/viewModels/auth/manager/sign_in/sign_in_notifier.dart';
import 'package:football_news_app/viewModels/auth/manager/sign_in/sign_in_state.dart';
import 'package:football_news_app/viewModels/auth/manager/sign_out/sign_out_notifier.dart';
import 'package:football_news_app/viewModels/auth/manager/sign_out/sign_out_state.dart';
import 'package:football_news_app/viewModels/auth/manager/sign_up/sign_up_notifier.dart';
import 'package:football_news_app/viewModels/auth/manager/sign_up/sign_up_state.dart';

import '../../../data/auth/remote/auth_remote_data_source.dart';
import '../../../data/repositories/auth/auth_repositories.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(firebaseAuth: ref.watch(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(authRemoteDataSource: ref.watch(authRemoteDataSourceProvider));
});


final signUpNotifierProvider = StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpNotifier(authRepository: repository);
});

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInNotifier(authRepository: repository);
});

final signOutNotifierProvider = StateNotifierProvider<SignOutNotifier, SignOutState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutNotifier(authRepository: repository);
});