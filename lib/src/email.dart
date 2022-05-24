import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

enum EmailValidationError {
  empty,
  invalid,
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (!string_validator.isEmail(value)) return EmailValidationError.invalid;
    return null;
  }
}
