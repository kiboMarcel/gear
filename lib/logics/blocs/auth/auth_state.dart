part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final fbauth.User? user;
  AuthState({
    required this.authStatus,
    this.user,
  });

  @override
  List<Object?> get props => [authStatus, user];

  factory AuthState.unknown() {
    return AuthState(authStatus: AuthStatus.unknown);
  }

  @override
  String toString() => 'AuthState(authStatus: $authStatus, user: $user)';

  AuthState copyWith({
    AuthStatus? authStatus,
    fbauth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
/* 
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'authStatus': authStatus});
    if (user != null) {
      result.addAll({'user': user!});
    }

    return result;
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      authStatus: map['authStatus'] ?? '',
      user: map['user'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source)); */
}
