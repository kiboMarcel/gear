part of 'signin_cubit.dart';

class SigninState extends Equatable {
  final SignStatus signstatus;
  final User user;
  final CustomError error;
  SigninState({
    required this.signstatus,
    required this.user,
    required this.error,
  });

  factory SigninState.initial() {
    return SigninState(
      signstatus: SignStatus.initial,
      user: User.intialUser(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [signstatus, user, error];

  @override
  String toString() =>
      'SigninState(signstatus: $signstatus, user: $user ,  error: $error)';

  SigninState copyWith({
    SignStatus? signstatus,
    User? user,
    CustomError? error,
  }) {
    return SigninState(
      signstatus: signstatus ?? this.signstatus,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
