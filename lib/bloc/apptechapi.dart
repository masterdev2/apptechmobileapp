import 'dart:convert';

import 'package:apptech/bloc/json.dart';
import 'package:apptech/bloc/user.dart';
import 'package:apptech/ressources/values/languages.dart';
import 'package:http/http.dart' as http;

import 'enums.dart';

enum EmailVerif {
  ok,
  captcha,
  notFound,
  error,
}

const responseCodeNames = {
  'validation_mail_sent': ResponseCode.validationMailSent,
  'reset_password_mail_sent': ResponseCode.resetPasswordMailSent,
  'email_account_found': ResponseCode.emailAccountFound,
  'success': ResponseCode.success,
};

ResponseCode responseCodeName(String code) =>
    responseCodeNames[code] ?? ResponseCode.error;

class AppTechApi with JsonBase {
  static const String api = 'http://demo-apptech.com/Apis/Login';
  static const String profile = 'http://demo-apptech.com/Apis/Login';
  static const String login = 'http://demo-apptech.com/Apis/Login';
  static const String grantType = 'password';

  AppTechApi.instance();

  Future<User> logIn(String user_name, String password) async {
    try {
      final client = http.Client();

      final map = Map<String, String>();
      map['user_name'] = user_name;
      map['password'] = password;

      final response = await client.post(login, body: map).timeout(
          const Duration(seconds: 10),
          onTimeout: () => http.Response('Request Timeout', 504));

      if (response.statusCode == 200) {
        final jsonPlus = json.decode(response.body);
        jsonPlus['data']['token'];
        String mytoken = jsonPlus['data']['token'];
        if (jsonPlus['data']['token'] is String) {
          final tokeen = jsonPlus['data']['token'];
          print(tokeen);
          User user = User.fromJson(jsonPlus['data']);

         return user;
        }
      } else {
        print('logIn Failed with statusCode : ${response.statusCode}');
        if (response.statusCode == 401) {
          //   Scaffold.of().showSnackBar(SnackBar(content: Text('gg'))) ;
          return null;
        }
      }
    } catch (e) {
      print('logIn Exeption : $e');
    }
    return null;
  }

  Future<User> fetchProfile(String token) async {
    try {
      final client = http.Client();
      final map = Map<String, String>();
      map['Authorization'] = 'Bearer $token';
      print(profile);
      final response = await client.get(profile, headers: map).timeout(
          const Duration(seconds: 10),
          onTimeout: () => http.Response('Request Timeout', 504));

      if (response.statusCode == 200) {
        final map = json.decode(response.body);
        print(map);
        return User.fromJson(map);
      } else {
        print('fetchProfile Failed with statusCode : ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('fetchProfile Exeption : $e');
      return null;
    }
  }
}
