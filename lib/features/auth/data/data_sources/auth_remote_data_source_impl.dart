import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_news_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:football_news_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:football_news_app/features/auth/domain/entities/sign_up_entity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<User?> signUp({required SignUpEntity signUpEntity}) async {
    UserCredential authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: signUpEntity.email,
        password: signUpEntity.password
    );
    await authResult.user?.updateDisplayName(signUpEntity.userName);
    await authResult.user?.reload();
    return firebaseAuth.currentUser;
  }

  @override
  Future<User?> signIn({required SignInEntity signInEntity}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: signInEntity.email,
        password: signInEntity.password
    );
    await firebaseAuth.currentUser!.reload();
    return firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}