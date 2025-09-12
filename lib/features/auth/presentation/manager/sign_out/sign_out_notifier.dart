import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_out/sign_out_state.dart';

class SignOutNotifier extends StateNotifier<SignOutState> {
  final SignOutUseCase signOutUseCase;

  SignOutNotifier({required this.signOutUseCase}) : super(SignOutInitial());

  Future<void> signOut() async {
    state = SignOutLoading();
    try {
      await signOutUseCase.call();
      state = SignOutSuccess();
    } catch (e) {
      state = SignOutError(e.toString());
    }
  }
}