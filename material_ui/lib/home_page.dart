import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

      ),
      appBar: AppBar(
        title: Text('Meme Dash', textAlign: TextAlign.right,),
        actions: <Widget>[
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.more_vert, 
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Meme')
                ],
              ),
            ),
          ],
        ),        
      ),
       bottomNavigationBar: new Theme(data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Color.fromARGB(255, 45, 65, 82),
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Color.fromARGB(255, 187, 158, 0),
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))),


        child: BottomNavigationBar(

          currentIndex: _cIndex,
          type: BottomNavigationBarType.shifting ,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 187, 158, 0)),
              title: new Text('Home', style: TextStyle(color: Color.fromARGB(255, 187, 158, 0)),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Color.fromARGB(255, 187, 158, 0)),
              title: new Text('Dashboard', style: TextStyle(color: Color.fromARGB(255, 187, 158, 0)),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment,color: Color.fromARGB(255, 187, 158, 0)),
              title: new Text('Payment', style: TextStyle(color: Color.fromARGB(255, 187, 158, 0)),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Color.fromARGB(255, 187, 158, 0)),
              title: new Text('Settings', style: TextStyle(color: Color.fromARGB(255, 187, 158, 0)),)
            )
          ],
          onTap: (index){
              _incrementTab(index);
          },
        ),
      ),
    );
  }
}