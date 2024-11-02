import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  Future<void> _onRegisterButtonPressed(RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterInitial());
    emit(RegisterLoading());

    try {
      final response = await Supabase.instance.client.auth.signUp(email: event.email, password: event.password);
      if (response.user != null) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError('Unknown error'));
      }
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }
}
