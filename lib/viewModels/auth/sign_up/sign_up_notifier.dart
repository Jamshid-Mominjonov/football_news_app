import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/auth/auth_repositories.dart';
import '../../../../models/auth/sign_up_model.dart';
import 'sign_up_state.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthRepository authRepository;

  SignUpNotifier({required this.authRepository}) : super(SignUpInitial());

  Future<void> signUp({required SignUpModel signUpModel}) async {
    if (signUpModel.password != signUpModel.confirmPassword) {
      state = SignUpError("Passwords don't match");
      return;
    }

    if (signUpModel.email.isEmpty || signUpModel.userName.isEmpty) {
      state = SignUpError("Fill all fields");
      return;
    }

    state = SignUpLoading();
    try {
      final user = await authRepository.signUp(signUpEntity: signUpModel);
      state = SignUpSuccess(user);
    } catch (e) {
      state = SignUpError(e.toString());
    }
  }
}