import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

void main() {
  runApp(MaterialApp(
    home: FirebaseFbPage(),
  ));
}

class FirebaseFbPage extends StatefulWidget {
  @override
  _FirebaseFbPageState createState() => _FirebaseFbPageState();
}

class _FirebaseFbPageState extends State<FirebaseFbPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  FirebaseUser myUser;

  Future<FirebaseUser> _loginWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(['email']);
    FacebookAccessToken facebookAccessToken = result.accessToken;


    debugPrint(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
      FirebaseUser fbUser;
      fbUser = (await _auth.signInWithCredential(authCredential)).user;
      return fbUser;
    }
    return null;
  }



  void _logOut() async {
    await _auth.signOut().then((response) {
      isLogged = false;
      setState(() {});
    });
  }

  void _logIn() {
    _loginWithFacebook().then((response) {
      if (response != null) {
        myUser = response;
        isLogged = true;
        setState(() {});
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogged ? "Profile Page" : "Facebook Login Example"),
        actions: <Widget>[
          isLogged
              ? IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: _logOut,
          )
              : IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: isLogged
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ' + myUser.displayName),
            Image.network(myUser.photoUrl),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FacebookSignInButton(
              onPressed: _logIn,
            ),

          ],
        ),
      ),
    );
  }
}