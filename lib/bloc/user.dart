
class User {
  final int id;
  final String key;
  final String user_name;
  final String email;
  final String photo;
  final String designations_id;
  final String user_id;
  final String last_login;
  final int online_time;
  final bool loggedin;
  final String user_type;
  final int user_flag;
  final String direction;
  final String token;

  User({
    this.id,
    this.key,
    this.user_name,
    this.email,
    this.photo,
    this.designations_id,
    this.user_id,
    this.last_login,
    this.online_time,
    this.loggedin,
    this.user_type,
    this.user_flag,
    this.direction,
    this.token,
  });

  static const String table = 'table_user';

  static const String id$ = 'id';
  static const String key$ = 'key';
  static const String user_name$ = 'user_name';
  static const String email$ = 'email';
  static const String photo$ = 'photo';
  static const String designations_id$ = 'designations_id';
  static const String user_id$ = 'user_id';
  static const String last_login$ = 'last_login';
  static const String online_time$ = 'online_time';
  static const String loggedin$ = 'loggedin';
  static const String user_type$ = 'user_type';
  static const String user_flag$ = 'user_type';
  static const String direction$ = 'direction';
  static const String token$ = 'token';

  static List<String> columns = [
    id$,
    key$,
    user_name$,
    email$,
    photo$,
    designations_id$,
    user_id$,
    last_login$,
    online_time$,
    loggedin$,
    user_type$,
    user_flag$,
    direction$,
    token$,
  ];

  static String create = '''
                  create table $table ( 
                  ${id$} integer primary key autoincrement,
                  ${key$} text,
                  ${user_name$} text,
                  ${email$} text,
                  ${photo$} text,
                  ${designations_id$} text,
                  ${user_id$} text,
                  ${last_login$} text,
                  ${online_time$} text,
                  ${loggedin$} text,
                  ${user_type$} text,
                  ${user_flag$} text,
                  ${direction$} text,
                  ${token$} text,
                  ''';

  String get name => '$user_name';

  factory User.fromJson(
      Map<String, dynamic> json) {


    return User(
      key: (json['id'] as String ?? '').trim(),
      user_name: (json['user_name'] as String ?? '').trim(),
      email: (json['email'] as String ?? '').trim(),
      photo: (json['photo'] as String ?? '').trim(),
      designations_id: (json['designations_id'] as String ?? '').trim(),
      user_id: (json['user_id'] as String ?? '').trim(),
      last_login: (json['last_login'] as String ?? '').trim(),
      online_time: (json['online_time'] ?? ''),
      loggedin: (json['loggedin'] ?? ''),
      user_type: (json['user_type'] as String ?? '').trim(),
      user_flag: (json['user_flag'] ?? ''),
      direction: (json['direction'] as String ?? '').trim(),
      token: (json['token'] as String ?? '').trim(),

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      key$: this.key,
      user_name$: this.user_name,
      email$: this.email,
      photo$: this.photo,
      designations_id$: this.designations_id,
      user_id$: this.user_id,
      last_login$: this.last_login,
      online_time$: this.online_time,
      loggedin$: this.loggedin,
      user_type$: this.user_type,
      user_flag$: this.user_flag,
      direction$: this.direction,
      token$: this.token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map[id$],
      key: map[key$],
      user_name: map[user_name$],
      email: map[email$],
      photo: map[photo$],
      designations_id: map[designations_id$],
      user_id: map[user_id$],
      last_login: map[last_login$],
      online_time: map[online_time$],
      loggedin: map[loggedin$],
      user_type: map[user_type$],
      user_flag: map[user_flag$],
      direction: map[direction$],
      token: map[token$],
    );
  }

  static DateTime getDate(int expiresAt) {
    return DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + expiresAt);
  }

}
