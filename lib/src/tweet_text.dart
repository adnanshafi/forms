import 'package:formz/formz.dart';

enum TweetInputError { empty, tooLong }

class TweetTextInput extends FormzInput<String, TweetInputError> {
  const TweetTextInput.pure() : super.pure('');
  const TweetTextInput.diirty([String value = '']) : super.dirty(value);

  @override
  TweetInputError? validator(String value) {
    if (value.isEmpty) return TweetInputError.empty;
    if (value.length > 160) return TweetInputError.tooLong;
    return null;
  }
}
