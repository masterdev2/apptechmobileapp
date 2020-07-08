import 'dart:async';

import 'package:apptech/ressources/values/languages.dart';
import 'package:apptech/ressources/values/regexps.dart';

class AuthenticationValidator {
  static LangType language = LangType.fr;

  final StreamTransformer<String, String> validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final RegExp emailExp = new RegExp(RegExps.emailRule);

    if (!emailExp.hasMatch(email) || email.isEmpty) {
      sink.addError(Strings.emailError.of(language));
    } else {
      sink.add(email);
    }
  });

  final StreamTransformer<String, String> validatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    final RegExp passwordExp = new RegExp(RegExps.min8Chars);

    if (!passwordExp.hasMatch(password)) {
      sink.addError(Strings.passwordError.of(language));
    } else {
      sink.add(password);
    }
  });
}
