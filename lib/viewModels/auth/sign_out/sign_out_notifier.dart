import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/auth/auth_repositories.dart';
import 'sign_out_state.dart';

class SignOutNotifier extends StateNotifier<SignOutState> {
  final AuthRepository authRepository;

  SignOutNotifier({required this.authRepository}) : super(SignOutInitial());

  Future<void> signOut() async {
    state = SignOutLoading();
    try {
      await authRepository.signOut();
      state = SignOutSuccess();
    } catch (e) {
      state = SignOutError(e.toString());
    }
  }
}