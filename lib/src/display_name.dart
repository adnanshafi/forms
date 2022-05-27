import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as s_v;

enum NameValidationError {
  empty,
  tooLong,
  tooShort,
  notAlpha,
}

class NameInput extends FormzInput<String, NameValidationError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    if (!s_v.isAlpha(value)) return NameValidationError.notAlpha;
    if (value.length < 3) return NameValidationError.tooShort;
    if (value.length > 20) return NameValidationError.tooLong;
    return null;
  }
}
