import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as s_v;

enum TweetValidationError {
  empty,
  tooLong,
  tooShort,
  notAlpha,
}

class TweetInput extends FormzInput<String, TweetValidationError> {
  const TweetInput.pure() : super.pure('');
  const TweetInput.dirty([String value = '']) : super.dirty(value);

  @override
  TweetValidationError? validator(String value) {
    if (value.isEmpty) return TweetValidationError.empty;
    if (value.length < 3) return TweetValidationError.tooShort;
    if (value.length > 160) return TweetValidationError.tooLong;
    return null;
  }
}
