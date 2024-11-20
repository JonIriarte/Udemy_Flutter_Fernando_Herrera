import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/email.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';
import 'package:forms_app/infrastructure/inputs/username.dart';
import 'package:formz/formz.dart';
import 'dart:developer';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void usernameChanged(String value) {
    final username = UserName.dirty(value);
    final isValid = Formz.validate([username, state.email, state.password]);
    emit(state.copyWith(
      username: username,
      isValid: isValid,
      formStatus: isValid ? FormStatus.valid : FormStatus.invalid,
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    final isValid = Formz.validate([state.username, email, state.password]);
    emit(state.copyWith(
      email: email,
      isValid: isValid,
      formStatus: isValid ? FormStatus.valid : FormStatus.invalid,
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final isValid = Formz.validate([state.username, state.email, password]);
    emit(state.copyWith(
      password: password,
      isValid: isValid,
      formStatus: isValid ? FormStatus.valid : FormStatus.invalid,
    ));
  }

  void onSubmit() {
    final username = UserName.dirty(state.username.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    // Validate the form
    final isValid = Formz.validate([username, email, password]);

    emit(state.copyWith(
      username: username,
      email: email,
      password: password,
      isValid: isValid,
      formStatus: FormStatus.validating,
    ));

    if (isValid) {
      log(
          'Form is valid: ${state.username.value}, ${state.email.value}, ${state.password.value}');
      emit(state.copyWith(formStatus: FormStatus.valid));
    } else {
      log('Form is invalid.');
      emit(state.copyWith(formStatus: FormStatus.invalid));
    }
  }
}
