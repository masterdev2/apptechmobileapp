import 'package:apptech/Widget/decision_page.dart';
import 'package:apptech/auth/loginPage.dart';
import 'package:apptech/intervention/InterventionPage.dart';
import 'package:apptech/ressources/values/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'bloc/authentication.dart';
import 'bloc/databloc.dart';

class Application extends StatelessWidget {
  static const String root = '/';
  static const String authentication_page = '/loginPage';
  static const String main_page = '/main';
  static const String interventions_page = '/interventionPage';

  static void redirectToPage(BuildContext context, String page,
      {dynamic data}) {
    Navigator.pushNamed(context, page, arguments: data);
  }

  AnimationController controller;
  LangType _language = LangType.fr;

  @override
  Widget build(BuildContext context) {
    final bloc = Authentication.instance();
    return MultiProvider(
      providers: [
        Provider<Authentication>(
          create: (context) => Authentication.instance(),
          dispose: (_, value) => value.dispose(),
        ),
        ProxyProvider<Authentication, DataBloc>(
          update: (_, auth, __) => DataBloc.instance(auth: auth),
          dispose: (_, value) => value.dispose(),
        ),
      ],
      child: new GetMaterialApp(
        navigatorKey: Get.key,
        title: Strings.name.of(_language),
        theme: new ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: authentication_page,
        routes: {
          root: (_) => DecisionPage(),
          authentication_page: (_) => LoginPage(),
          interventions_page: (_) => InterventionsPage(),
        },
      ),
    );
  }
}
