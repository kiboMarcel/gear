part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  AuthState({
    required this.authStatus,
  });

  @override
  List<Object?> get props => [authStatus];

  factory AuthState.unknown() {
    return AuthState(authStatus: AuthStatus.unknown);
  }

  @override
  String toString() => 'AuthState(authStatus: $authStatus)';

  AuthState copyWith({
    AuthStatus? authStatus,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
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
