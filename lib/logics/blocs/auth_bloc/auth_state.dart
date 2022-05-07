part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticating extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final String userId;

  Authenticated({this.userId});
  @override
  List<Object> get props => [userId];
}

class AuthenticationError extends AuthState {
  final String errorMsg;

  const AuthenticationError({this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
