import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ktm/data/repositories/authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  AuthBloc() : super(UnAuthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(Authenticating());
      try {
        final String msg = await authenticationRepository.signInFunc(
            email: event.email, password: event.password);

        if (msg != 'Error') {
          emit(Authenticated(userId: msg));
        } else {
          emit(AuthenticationError(errorMsg: "Login credentials do not match"));
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticationError(errorMsg: e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(Authenticating());
      try {
        final String response = await authenticationRepository.signUpFunc(
          context: event.context,
          key: event.key,
          emailTC: event.email,
          passTC: event.password,
          fnameTC: event.firstName,
          lnameTC: event.lastName,
          areaTC: event.street,
          townTC: event.town,
          districtTC: event.city,
          stateTC: event.state,
          pinTC: event.pinCode,
          phNoTC: event.phNumber,
          unformattedSelectedDate: event.dob,
        );
        if (response != "Error") {
          emit(Authenticated(userId: response));
        } else {
          emit(AuthenticationError(
              errorMsg: "This e-mail id is already registered."));
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticationError(errorMsg: e.toString()));
        emit(UnAuthenticated());
      }
    });
  }
}


  // UserModel(
  //         email: event.email,
  //         name: "${event.firstName}" + " " + "${event.lastName}",
  //         dob: event.dob,
  //         phNo: event.phNumber,
  //       );
  //       final UserModel user = UserModel();
  //       print(user.email);