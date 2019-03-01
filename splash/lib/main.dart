import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Meme',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.only(top: 24.0),
          children: <Widget>[
            DrawerHeader(
              child: new Container(
                  width: 190.0,
                  height: 190.0,
              ),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//               //shape: BoxShape.circle,
//              ),
              decoration: new BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/profile.jpg')
                )
              )
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(icon: Icon(Icons.person), onPressed: null)
                ),
                Expanded(
                  child: Text('Profile', textAlign: TextAlign.center),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.settings), onPressed: null),
                    Text('Settings', textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(icon: Icon(Icons.more), onPressed: null)
                    ),
                    Expanded(
                      child: Text('About', textAlign: TextAlign.center),
                    ),
                  ],
                )

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
            title: Text('Meme'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.map, color: Colors.black),
                tooltip: 'Map',
                onPressed: (){},
              ),
            IconButton(
               icon: Icon(Icons.android, color: Colors.black),
               tooltip: 'Android',
               onPressed: (){},
             ),
             IconButton(
               icon: Icon(Icons.playlist_add_check, color: Colors.black),
               tooltip: 'Repair it',
               onPressed: (){},
             ),
            ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Inayofuata'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        fixedColor: Colors.deepPurple,
      ),


    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios, color: Colors.white,            
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueGrey,
        title: Text("Ugeene"),

      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Rudi Nyuma'),
        ),
        
      ),
    );
  }
}