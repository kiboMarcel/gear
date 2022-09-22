import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../constants/enums.dart';
import '../../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authStreamSubscription;
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthState.unknown()) {
    authStreamSubscription = authRepository.user.listen((fbauth.User? user) {
      add(AuthStateChangedEvent(user: user));
    });
    on<AuthStateChangedEvent>((event, emit) {
      if (event.user != null) {
        if (event.user?.emailVerified == true) {
          emit(state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: event.user,
          ));
        } else {
          emit(state.copyWith(
            authStatus: AuthStatus.verifyEmail,
            user: event.user,
          ));
        }
      } else {
        emit(state.copyWith(
          authStatus: AuthStatus.unauthanticated,
          user: null,
        ));
      }
    });

    on<SignOutRequestEvent>((event, emit) async {
      await authRepository.signout();
    });
  }
  @override
  Future<void> close() {
    authStreamSubscription.cancel();
    return super.close();
  }

  /* @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  } */
}
