import 'package:firebase_auth/firebase_auth.dart';

import '../entities/sign_in_entity.dart';
import '../entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<User?> signUp({required SignUpEntity signUpEntity});
  Future<User?> signIn({required SignInEntity signInEntity});
  Future<void> signOut();
}