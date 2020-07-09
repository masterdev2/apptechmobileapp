import 'package:apptech/Widget/bezierContainer.dart';
import 'package:apptech/Widget/gradient_button.dart';
import 'package:apptech/Widget/styled_text_field.dart';
import 'package:apptech/auth/signup.dart';
import 'package:apptech/bloc/authentication.dart' as _auth;
import 'package:apptech/ressources/commun/myLabels.dart';
import 'package:apptech/ressources/commun/myMethods.dart';
import 'package:apptech/ressources/commun/myStyles.dart';
import 'package:apptech/ressources/values/languages.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _user_nameController;
  TextEditingController _passwordController;

  //AuthenticationFormBloc _authenticationFormBloc;

  DateTime _currentBackPressTime = DateTime.now().add(Duration(seconds: -10));
  _auth.Authentication _authBloc;
  var connectivityResult;

  @override
  void initState() {
    super.initState();

    new Connectivity()
        .checkConnectivity()
        .then((val) => connectivityResult = val);

    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) => connectivityResult = result);

    _user_nameController = TextEditingController();
    _passwordController = TextEditingController();
    //  _authenticationFormBloc = AuthenticationFormBloc();
  }

  @override
  void dispose() {
    _user_nameController?.dispose();
    _passwordController?.dispose();
    //_authenticationFormBloc?.dispose();
    super.dispose();
  }

  Future<bool> _onWillPopScope() async {
    SystemNavigator.pop();
  }

  Widget emailField(hint) {
    return StreamBuilder<String>(
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: StyledTextField(
            controller: _user_nameController,
            hintText: hint,
            icon: Icons.person_outline,
            color: Colors.blueGrey,
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(hint) {
    return StreamBuilder<String>(
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: StyledTextField(
            controller: _passwordController,
            hintText: hint,
            textColor: MyStyles.textColor,
            obscureText: true,
            icon: Icons.lock,
            color: Colors.blueGrey,
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(text, auth) {
    return StreamBuilder<bool>(
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: GradientButton(
            text: MyLabels.label_connect,
            colorEnd: MyStyles.endColor,
            colorStart: MyStyles.startColor,
            onPressed: //            (snapshot.hasData && snapshot.data == true) ?
                () async {
              if (connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi) {
                auth.signIn(
                    user_name: _user_nameController.text,
                    password: _passwordController.text);
              } else {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Aucune connexion')));
              }
            },
            //                : null,
          ),
        );
      },
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    _auth.Authentication auth = Provider.of<_auth.Authentication>(context);
    // _authenticationFormBloc.setLanguage(bloc.getLanguage.value);

    final butText = Strings.logIn.of(auth.getLanguage.value);
    final passHint = Strings.passwordHintText.of(auth.getLanguage.value);
    final emailHint = Strings.emailHintText.of(auth.getLanguage.value);
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: SafeArea(
        child: Scaffold(
          body: new Stack(
            children: [
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraintss) =>
                    SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraintss.maxHeight),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.symmetric(vertical: 22)),
                          Padding(padding: EdgeInsets.all(10)),
                          emailField(emailHint),
                          passwordField(passHint),
                          submitButton(butText, auth),
                          new Container(
                            margin: EdgeInsets.zero,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.zero),
                                Column(
                                  children: <Widget>[
                                    new FlatButton(
                                        onPressed: () {
//                                          Navigator.of(context).push(
//                                            PageRouteBuilder(
//                                              pageBuilder: (context, _, __) {
//                                                return SignUpPage();
//                                              },
//                                            ),
//                                          );
                                          MyMethods.navigate(0, SignUpPage());
                                        },
                                        child: new Text(
                                          MyLabels.label_create_compte,
                                          style: MyStyles.textStyle,
                                        ))
                                  ],
                                ),
                                Text(
                                  MyLabels.label_separator,
                                  style: MyStyles.textStyle,
                                ),
                                Column(
                                  children: <Widget>[
                                    new FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        MyLabels.label_forgot_password,
                                        style: MyStyles.textStyle,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
