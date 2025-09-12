import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:football_news_app/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import '../../../domain/entities/sign_up_entity.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpNotifier({required this.signUpUseCase}) : super (SignUpInitial());

  Future<void> signUp({required SignUpEntity signUpEntity}) async {
    if(signUpEntity.password != signUpEntity.confirmPassword) {
      state = SignUpError("Passwords don't match");
      return;
    }
    state = SignUpLoading();
   try {
     final user = await signUpUseCase.call(signUpEntity: signUpEntity);
     state = SignUpSuccess(user);
   } catch (e) {
     state = SignUpError(e.toString());
   }
  }
 }