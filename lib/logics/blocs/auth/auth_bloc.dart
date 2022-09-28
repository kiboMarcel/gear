import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authStreamSubscription;
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthState.unknown()) {
    checkStatus();
  }

  Future<void> checkStatus() async {
    int? status = await authRepository.checkStatus();
    if (status == null) {
      emit(state.copyWith(authStatus: AuthStatus.unauthanticated));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    }
  }

  @override
  Future<void> close() {
    authStreamSubscription.cancel();
    return super.close();
  }
}
