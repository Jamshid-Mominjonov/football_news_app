import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/auth/auth_repositories.dart';
import '../../../../models/auth/sign_in_model.dart';
import 'sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final AuthRepository authRepository;

  SignInNotifier({required this.authRepository}) : super(SignInInitial());

  Future<void> signIn({required SignInModel signInModel}) async {
    if (signInModel.email.isEmpty || signInModel.password.isEmpty) {
      state = SignInError('Fill all fields');
      return;
    }

    state = SignInLoading();
    try {
      final user = await authRepository.signIn(signInEntity: signInModel);
      state = SignInSuccess(user);
    } catch (e) {
      state = SignInError(e.toString());
    }
  }
}