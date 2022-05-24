import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  tooLong,
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 6) return PasswordValidationError.tooShort;
    if (value.length > 12) return PasswordValidationError.tooLong;
    return null;
  }
}
