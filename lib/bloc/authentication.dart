import 'dart:convert';

import 'package:apptech/bloc/apptechapi.dart';
import 'package:apptech/bloc/databloc.dart';
import 'package:apptech/bloc/json.dart';
import 'package:apptech/bloc/user.dart';
import 'package:apptech/dashboard/DashboardPage.dart';
import 'package:apptech/ressources/values/languages.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StateType {
  Uninitialized,
  Authenticating,
  EmailVerified,
  EmailNotFound,
  Authenticated,
  Unauthenticated,
}

class AuthenticationState {
  final StateType state;
  final User user;
  // final Captcha captcha;
  AuthenticationState({
    this.user,
    this.state = StateType.Uninitialized,
  });
}

class Authentication with JsonBase {
  final AppTechApi _api;
  final DataBloc data;

  final BehaviorSubject<AuthenticationState> _state;
  ValueObservable<AuthenticationState> get state => _state.stream;

  String _user_name;
  String _password;
  String _error;

  BehaviorSubject<LangType> _language = new BehaviorSubject();
  ValueObservable<LangType> get getLanguage => _language.stream;

  BehaviorSubject<String> _lang;
  ValueObservable<String> get getlang => _lang.stream;

  setLanguage(LangType type) async {
    final a = switchType(type);
    getLanguageCache(language: a);
    // _language.sink.add( _switchType(result));
  }

  checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefTheme =
        prefs.getString("theme") == null ? "light" : prefs.getString("theme");
    print("THEME: $prefTheme");
    // theme = prefTheme;
  }

  Authentication.instance({this.data})
      : _api = AppTechApi.instance(),
        _language = BehaviorSubject<LangType>(),
        _lang = BehaviorSubject<String>()..sink.add('fr'),
        _state = BehaviorSubject<AuthenticationState>()
          ..sink.add(AuthenticationState()) {
    setLanValue();
  }

  void dispose() {
    _state.close();
    _language.close();
    _lang.close();
  }

  String get user_name => _user_name;
  String get password => _password;
  String get error => _error;

  void _onStateChanged(AuthenticationState state) async {
    if (_state.value?.state != state.state) {
      if (state.state == StateType.Authenticated) {
        _state.sink.add(state);
      } else {
        _state.sink.add(state);
      }
    }
  }

  LangType _switchType(String type) {
    switch (type) {
      case 'ar':
        return LangType.ar;
      case 'fr':
        return LangType.fr;
      case 'en':
        return LangType.en;
      default:
        return LangType.fr;
    }
  }

  String switchType(LangType type) {
    switch (type) {
      case LangType.ar:
        return 'ar';
      case LangType.fr:
        return 'fr';
      case LangType.en:
        return 'en';
      default:
        return 'fr';
    }
  }

  void signIn({String user_name, String password}) async {
    _error = 'erreuur';
    _password = password;
    _user_name = user_name;
    _onStateChanged(AuthenticationState(state: StateType.Authenticating));
    final user = await _api.logIn(user_name, password);
    if (_user_name == null) {
      _error = 'connection error';
      _onStateChanged(AuthenticationState(state: StateType.EmailVerified));
    } else {
      _user_name = null;
      _password = null;
      _onStateChanged(
          AuthenticationState(state: StateType.Authenticated, user: user));
    }
  }

  void signOut() async {
    _onStateChanged(AuthenticationState(state: StateType.Authenticating));
    _onStateChanged(AuthenticationState(state: StateType.Unauthenticated));
  }

  setLanValue({String type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefTheme =
        prefs.getString("lang") == null ? "fr" : prefs.getString("lang");

    _lang.sink.add(prefTheme);
    _language.sink.add(_switchType(prefTheme.toString()));
  }

  Future<String> saveOnCache(String type) async {
    var jsonName = 'langue';

    if (type == null) {
      getJsonFromLocal(jsonName, asset: true).then((local) {
        if (local['langue'] != null && local['langue'] == type) {
          print('local' + local['langue']);
          return local['langue'];
        }
      });
    } else {
      var query = {jsonName: type ?? 'fr'};
      print('bla bla' + json.encode(query));
      saveJsonToLocal(jsonName, json.encode(query));
      return type;
    }
  }

  getLanguageCache({String language}) {
//  _language.sink.add( _switchType(language));
    try {
      if (_lang.value != null) {
        _language.sink.add(_switchType(_lang.value.toString()));
        print(_lang.value);
      } else {
        _language.sink.add(_switchType(language));
      }
    } catch (e) {
      print(e);
    }
  }
}
