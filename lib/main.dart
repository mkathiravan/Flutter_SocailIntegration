import 'package:flutter/material.dart';

import 'facebookauth.dart';
import 'firebasefbauth.dart';
import 'login_page.dart';
import 'loginfacebook.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Social Integration"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 40),
              MaterialButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                minWidth: double.infinity,
                child: Text("Facebook"),
                color: Colors.redAccent,
                textColor: Colors.white,
                splashColor: Colors.grey,
                //padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FacebookLoginDemo();
                  }));
                },
              ),
              const SizedBox(height: 40),
              MaterialButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                minWidth: double.infinity,
                child: Text("Facebook View"),
                color: Colors.redAccent,
                textColor: Colors.white,
                splashColor: Colors.grey,
                //padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
              ),


              const SizedBox(height: 40),
              MaterialButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                minWidth: double.infinity,
                child: Text("Firebase using FB login"),
                color: Colors.redAccent,
                textColor: Colors.white,
                splashColor: Colors.grey,
                // padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FirebaseFbPage();
                  }));
                },
              ),

              const SizedBox(height: 40),
              MaterialButton(
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                minWidth: double.infinity,
                child: Text("Google"),
                color: Colors.redAccent,
                textColor: Colors.white,
                splashColor: Colors.grey,
                // padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),

                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return GoogleLoginPage();
                  }));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

}
