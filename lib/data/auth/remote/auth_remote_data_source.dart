import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/auth/sign_in_model.dart';
import '../../../models/auth/sign_up_model.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource({required this.firebaseAuth});

  Future<User?> signUp({required SignUpModel signUpEntity}) async {
    UserCredential authResult = await firebaseAuth.createUserWithEmailAndPassword(
      email: signUpEntity.email,
      password: signUpEntity.password,
    );

    await authResult.user?.updateDisplayName(signUpEntity.userName);
    await authResult.user?.reload();

    return firebaseAuth.currentUser;
  }

  Future<User?> signIn({required SignInModel signInEntity}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: signInEntity.email,
      password: signInEntity.password,
    );

    final user = firebaseAuth.currentUser;
    await user?.reload();

    return firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}