import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  tooLong,
  confirmError,
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value, {String? oldValue}) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (oldValue != null) {
      if (oldValue != value) {
        return PasswordValidationError.confirmError;
      }
    }
    if (value.length < 6) return PasswordValidationError.tooShort;
    if (value.length > 12) return PasswordValidationError.tooLong;
    return null;
  }
}

class ConfirmPasswordInput extends FormzInput<String, PasswordValidationError> {
  const ConfirmPasswordInput.pure()
      : confirmWith = '',
        super.pure('');
  const ConfirmPasswordInput.dirty({
    required String value,
    required String confirmValue,
  })  : confirmWith = confirmValue,
        super.dirty(value);

  final String confirmWith;

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value != confirmWith) return PasswordValidationError.confirmError;

    return null;
  }
}
