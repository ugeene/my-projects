import 'package:flutter/material.dart';

import './task_row.dart';

class UserProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _UserProfile();
  }
}

class _UserProfile extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildTimeLine(),
          _buildBackgroundImage(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
          
        ],
      ),
    );
  }


  Widget _buildBackgroundImage(){
    return new ClipPath(
      clipper: new DiagonalClipper(),
      child: new Image.asset(
        'images/bckimg.jpg',
        fit: BoxFit.fitHeight,
        height: 256.0,
        colorBlendMode: BlendMode.srcOver,
        color: new Color.fromARGB(120, 10, 10, 10),
        //color: new Color.fromARGB(150, 255, 255, 255),
      ),
    );
  }

  Widget _buildTopHeader(){
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          new Icon(Icons.menu, size: 25.0, color:Colors.white),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                'Timeline',
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          new Icon(Icons.linear_scale, color: Colors.white)
        ],
      ),
    );
  }

  Widget _buildProfileRow(){
    return new Padding(
      padding: new EdgeInsets.only(left: 16.0, top: 105),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            minRadius: 30.0,
            maxRadius: 35.0,
            backgroundImage: new AssetImage('images/profile.jpg'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  'Eugene Otolo',
                  style: new TextStyle(
                    fontSize: 26.0,
                    //color: Color.fromARGB(255, 45, 65, 82),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                new Text(
                  'ugeene.eo@gmail.com',
                  style: new TextStyle(
                    fontSize: 14.0,
                    //color: Color.fromARGB(255, 45, 65, 82),
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart(){
    return new Padding(
      padding: new EdgeInsets.only(top: 256.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTaskList(),
        ],
      ),
    );
  }


  Widget _buildTaskList(){
    return new Expanded(
      child: new ListView(
        children: tasks.map((task) => new TaskRow(task: task)).toList(),
      ),
    );
  }


  Widget _buildMyTasksHeader(){
    return new Padding(
      padding: new EdgeInsets.only(left: 64.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'My Rides',
            style: new TextStyle(fontSize: 34.0),
          ),
          // new Text(
          //   'March 28, 2019',
          //   style: new TextStyle(color: Colors.black, fontSize: 12.0),
          // )
        ],
      ),
    );
  }

  Widget _buildTimeLine(){
    return new Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: new Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }

}

class DiagonalClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height - 60);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Task {
  final String date;
  final String pickUpLocation;
  final String dropLocation;
  final String rider;
  final String category;
  final String time;
  final Color color;
  final bool completed;

  Task({this.date, this.pickUpLocation, this.dropLocation, this.rider, this.category, this.time, this.color, this.completed});
}

List <Task> tasks = [
  new Task(
    date: 'March 12, 2019',
    pickUpLocation: 'Home',
    dropLocation: 'Work',
    rider: 'Felix',
    category: 'Pillion Ride',
    time: '08: 30 Hrs',
    color: Colors.cyan,
    completed: true
  ),

    new Task(
    date: 'March 12, 2019',
    pickUpLocation: 'Work',
    dropLocation: 'Home',
    rider: 'George',
    category: 'Pillion Ride',
    time: '18: 30 Hrs',
    color: Colors.orange,
    completed: true
  ),

    new Task(
    date: 'March 14, 2019',
    pickUpLocation: 'Guardian Booking Office',
    dropLocation: 'Work',
    rider: 'Moses',
    category: 'Parcel Pick-Up',
    time: '11: 45 Hrs',
    color: Colors.yellow,
    completed: true
  ),

    new Task(
    date: 'March 12, 2019',
    pickUpLocation: 'Home',
    dropLocation: 'Work',
    rider: 'Felix',
    category: 'Pillion Ride',
    time: '08: 30 Hrs',
    color: Colors.green,
    completed: true
  ),

    new Task(
    date: 'March 12, 2019',
    pickUpLocation: 'Work',
    dropLocation: 'Home',
    rider: 'George',
    category: 'Pillion Ride',
    time: '18: 30 Hrs',
    color: Colors.red,
    completed: true
  ),

    new Task(
    date: 'March 14, 2019',
    pickUpLocation: 'Guardian Booking Office',
    dropLocation: 'Work',
    rider: 'Moses',
    category: 'Parcel Pick-Up',
    time: '11: 45 Hrs',
    color: Colors.pink,
    completed: true
  ),
];
