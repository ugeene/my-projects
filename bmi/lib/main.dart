//Relook the alert dialog box for
//it isn't working

import 'package:flutter/material.dart';

void main () => runApp(new MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Create a material app widget

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          )
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('41'),
      ],
    ),
  );



  @override
  Widget build(BuildContext context){

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection =Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above the sea level, it is one of the '
        'Larger Alpine Lakes. A gondola ride from Kandersateg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warm to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing and riding the summer tobaggan run.',
        softWrap: true,
      ),
    );

    // Future<void> _neverSatisfied() async{
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Rewind and Remember'),
    //         content: SingleChildScrollView(
    //           child: ListBody(
    //             children: <Widget>[
    //               Text('You will never be satisfied.'),
    //               Text('You\'re like me. I\'m never satisfied'),
    //             ],
    //           ),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Regret'),
    //             onPressed: (){
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     }
    //   );
    // }

    
  // user defined function
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('Meme'),
                accountEmail: new Text('memeugeene@gmail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('M', style: TextStyle(fontSize: 35)
                  ),
                ),
              ),

              ListTile(
                leading: Icon(Icons.motorcycle),
                title: Text('Ride Bodaboda'),
                onTap: (){
                },
              ),
              ListTile(
                leading:  Icon(Icons.local_laundry_service),
                title: Text('Run Errands'),
                onTap: (){
                },
              ),
              ListTile(
                leading:  Icon(Icons.payment),
                title: Text('Payment'),
                onTap: () {
                },
              ),
              ListTile(
                leading:  Icon(Icons.history),
                title: Text('Ride History'),
                onTap: () {
                },
              ),
              new Divider(),
              ListTile(
                leading:  Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                },
              ),
              ListTile(
                leading:  Icon(Icons.info_outline),
                title: Text('About'),
                onTap: () {
                },
              ),
              ListTile(
                leading:  Icon(Icons.help_outline),
                title: Text('Help'),
                onTap: () {
                },
              ),
              new Divider(),
              ListTile(
                leading:  Icon(Icons.person_outline),
                title: Text('Profile'),
                onTap: () {
                },
              ),
              ListTile(
                leading:  Icon(Icons.directions_bike),
                title: Text('Become a Rider'),
                onTap: () {
                },
              ),
            ],
          ),
          
        ),


        // appBar: AppBar(
        //   title: Text('Flutter layout demo'),
        // ),


        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit:BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            IconButton(
              icon: Icon(Icons.apps),
              onPressed: () => _showDialog(),
              ),
          ],
        )
      )
    );
    
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column (
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            )
          ),
        )
      ],
    );
  }

}