part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpRequested extends AuthEvent {
  final GlobalKey<FormState> key;
  final BuildContext context;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String street;
  final String town;
  final String city;
  final String state;
  final String pinCode;
  final String phNumber;
  final String dob;

  SignUpRequested({
    this.context,
    this.key,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.dob,
    this.street,
    this.town,
    this.city,
    this.phNumber,
    this.pinCode,
    this.state,
  });

  @override
  List<Object> get props => [
        context,
        key,
        email,
        password,
        firstName,
        lastName,
        dob,
        street,
        town,
        city,
        phNumber,
        pinCode,
        state,
      ];
}
