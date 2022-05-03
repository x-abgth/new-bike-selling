import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:ktm/data/repositories/authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  AuthBloc() : super(UnAuthenticated()) {
    on<SignInRequested>((event, emit) {
      emit(Authenticating());
      try {
        authenticationRepository.signInFunc(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticationError(errorMsg: e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) {
      emit(Authenticating());
      try {
        final Response response = authenticationRepository.signUpFunc(
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
        if (response.statusCode == 200) {
          emit(Authenticated());
        }
      } catch (e) {
        emit(AuthenticationError(errorMsg: e.toString()));
        emit(UnAuthenticated());
      }
    });
  }
}
