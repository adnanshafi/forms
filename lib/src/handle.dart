import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as s_v;

enum HandleValidationError {
  empty,
  tooLong,
  tooShort,
  notAlpha,
}

class HandleInput extends FormzInput<String, HandleValidationError> {
  const HandleInput.pure() : super.pure('');
  const HandleInput.dirty([String value = '']) : super.dirty(value);

  @override
  HandleValidationError? validator(String value) {
    if (value.isEmpty) return HandleValidationError.empty;
    if (!s_v.isAlpha(value)) return HandleValidationError.notAlpha;
    if (value.length < 3) return HandleValidationError.tooShort;
    if (value.length > 9) return HandleValidationError.tooLong;
    return null;
  }
}
