import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_in/sign_in_state.dart';
import '../../../domain/entities/sign_in_entity.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final SignInUseCase signInUseCase;

  SignInNotifier({required this.signInUseCase}) : super(SignInInitial());

  Future<void> signIn({required SignInEntity signInEntity}) async {
    if(signInEntity.email.isEmpty || signInEntity.password.isEmpty) {
      state = SignInError('Fill all fields');
      return;
    }
      state = SignInLoading();
      try {
        final user = await signInUseCase.call(signInEntity: signInEntity);
        state = SignInSuccess(user);
      } catch (e) {
        state = SignInError(e.toString());
    }
  }
}