import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/auth/sign_in_model.dart';
import '../../../models/auth/sign_up_model.dart';
import '../../auth/remote/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository({required this.authRemoteDataSource});

  Future<User?> signUp({required SignUpModel signUpEntity}) {
    return authRemoteDataSource.signUp(signUpEntity: signUpEntity);
  }

  Future<User?> signIn({required SignInModel signInEntity}) {
    return authRemoteDataSource.signIn(signInEntity: signInEntity);
  }

  Future<void> signOut() {
    return authRemoteDataSource.signOut();
  }
}