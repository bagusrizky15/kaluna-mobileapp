import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    emit(LoginLoading());

    try {
      final response =
          await Supabase.instance.client.auth.signInWithPassword(email: event.email, password: event.password);

      if (response.user != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginError('Unknown error'));
      }
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }
}
