class RegExps {
  // passwords
  static String get min8Chars => r"^.{6,}$";
  static String get min8CharsOneLetterOneNumber => r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
  static String get min8CharsOneLetterOneNumberOnSpecialCharacter =>
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
  static String get min8CharsOneUpperLetterOneLowerLetterOnNumber =>
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
  static String get min8CharsOneUpperOneLowerOneNumberOneSpecial =>
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
  static String get min8Max10OneUpperOneLowerOneNumberOneSpecial =>
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$";

  // email
  static String get emailRule => r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
}
