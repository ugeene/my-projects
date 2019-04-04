import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import './register_page.dart';
import './signin_page.dart';


void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 20,

      //Will have to change the route
      navigateAfterSeconds: MyHomePage(title: 'Demo'),

      image: Image.asset(
        'images/logo_design.PNG',
      ),

      backgroundColor: Color.fromARGB(255, 45, 65, 82),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 170.0,

      // This will do something
      onClick: ()=>print("Will Do something"),
      loaderColor: Colors.white,
    );
  }
}

// class AfterSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//       title: new Text("Home"),
//       automaticallyImplyLeading: true,
//       ),

//     //This is an empty drawer
//       drawer: Drawer(
        
//       ),


//       body: new Center(
//         child: new Text("LOADED",
//         style: new TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 30.0
//         ),),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: const Text('Test registration'),
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: RaisedButton(
              child: const Text('Test SignIn/SignOut'),
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}