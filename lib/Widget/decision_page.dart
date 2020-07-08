import 'package:apptech/auth/loginPage.dart';
import 'package:apptech/bloc/authentication.dart';
import 'package:apptech/dashboard/DashboardPage.dart';
import 'package:apptech/intervention/InterventionPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecisionPage extends StatefulWidget {
  @override
  _DecisionPageState createState() => new _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  Authentication auth;

  void _redirectToRoot(BuildContext context, String root, {data}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed(root, arguments: data);
    });
  }


  @override
  void initState() {
    // auth = Provider.of<Authentication>(context) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Authentication auth = Provider.of<Authentication>(context);

    return new StreamBuilder<AuthenticationState>(
      stream: auth.state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data.state;
          switch (state) {
            case StateType.Authenticated:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InterventionsPage()));
          }
        }
        return WillPopScope(
            onWillPop: () => _onWillPopScope(context),
            child: Container(
                color: Colors.grey,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                )));
      },
    );
  }

  Future<bool> _onWillPopScope(BuildContext context) async {
    Navigator.pop(context);
    return Future.value(false);
  }
}
