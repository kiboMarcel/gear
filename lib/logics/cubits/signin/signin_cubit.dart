import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/enums.dart';
import '../../../data/models/custom_error.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;
  SigninCubit({required this.authRepository}) : super(SigninState.initial());

  Future<void> signin(
      {required String username, required String password}) async {
    emit(state.copyWith(signstatus: SignStatus.submiting));

    try {
      User user =
          await authRepository.signin(username: username, password: password);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('initScreen', 0);

      emit(state.copyWith(signstatus: SignStatus.success, user: user));
    } on CustomError catch (e) {
      emit(state.copyWith(
        signstatus: SignStatus.error,
        error: e,
      ));
    }
  }
}
