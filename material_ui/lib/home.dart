import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
  
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 45, 65, 82),
                ),
                accountName: new Text('meme'),
                accountEmail: new Text('memeugeene@gmail.com'),
                currentAccountPicture: new CircleAvatar(
                  //Will replace the image link below with the firebase link
                  backgroundImage: NetworkImage("https://media.licdn.com/dms/image/C5603AQHfWPUWAYA6VA/profile-displayphoto-shrink_200_200/0?e=1556755200&v=beta&t=Z01BxEQXb1_t2n-ldNDRRg3F0Y53EvoN55kR8cZZaWc"),
                  backgroundColor: Colors.white,
                  //child: new Text('M', style: TextStyle(fontSize: 35)
                  //),
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
                title: Text('Take a job'),
                onTap: () {
                  //_showMessage("Become a Rider", "This feature is coming in the next update");
                },
              ),
            ],
          ), 
        ),
        body: new Stack(
          children: <Widget>[
            _buildContainer(),
            _buildHeader(),
            _buildPickUpLocation(),
          ],
        ),
    );
  }

  Widget _buildContainer(){
    // TODO: Change this to Google Map Later
    return new Container(
      color: Colors.grey,
      child: new Card(

      ),
    );
  }

  Widget _buildHeader(){
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            new Icon(Icons.menu, size: 32.0, color: Color.fromARGB(255, 45, 65, 82),),
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: new Text(
                  'Select Pick-up Location',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 45, 65, 82),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            new Icon(Icons.linear_scale, size: 32.0, color: Color.fromARGB(255, 45, 65, 82))
          ],
        ),
      ),
    );
  }

  Widget _buildPickUpLocation(){
    return new Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 5.0),
      child: new Card(
        elevation: 8.0,
        //color: Color.fromARGB(255, 45, 65, 82),
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Search',
              onPressed: (){},
              icon: Icon(Icons.search, size: 30.0, color: Color.fromARGB(255, 45, 65, 82)),
            ),
            new Expanded(
              child: new Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: new Text(
                  'Search', 
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color.fromARGB(255, 45, 65, 82)
                  ),
                ),
              ),
            ),
            new IconButton(
              tooltip: 'My Location',
              onPressed: (){},
              icon: Icon(Icons.my_location, size: 25.0, color: Color.fromARGB(255, 45, 65, 82)),
            ),
          ],
        ),
      ),
    );
  }
}