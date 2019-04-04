import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';

import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:async';


import 'package:mapper/map/marker.dart';

// ignore: must_be_immutable
class UserDashboardScreen extends StatelessWidget {
  FirebaseUser currentUser;

  UserDashboardScreen(this.currentUser);
  
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                accountName: new Text('meme'),
                accountEmail: new Text('memeugeene@gmail.com'),
                currentAccountPicture: new CircleAvatar(
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
          body: FireMap(),
      )
    );
  }
}

// ignore: must_be_immutable
class UserDashboard extends StatefulWidget {
  FirebaseUser currentUser;

  UserDashboard(this.currentUser);

  @override
  _MyHomePageState createState() => new _MyHomePageState(currentUser);
}

class _MyHomePageState extends State<UserDashboard> {
  FirebaseUser currentUser;

  _MyHomePageState(this.currentUser);

  String lebel;

  @override
  void initState() {
    super.initState();
    if (currentUser.phoneNumber != null) {
      lebel = "Welcome\n" + currentUser.phoneNumber;
    } else if (currentUser.displayName != null) {
      lebel = "Welcome\n" + currentUser.displayName;
    } else {
      lebel = "Welcome\n" + currentUser.email;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: FireMap(),
      )
    );
  }
}

class FireMap extends StatefulWidget {
  State createState() => FireMapState();
}


class FireMapState extends State<FireMap> {
  GoogleMapController mapController;
  Location location = new Location();

  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  // Stateful Data
  BehaviorSubject<double> radius = BehaviorSubject(seedValue: 100.0);
  Stream<dynamic> query;

  // Subscription
  StreamSubscription subscription;

  build(context) {
    return Stack(children: [

    GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-0.1084439, 34.2655483),
            zoom: 15
          ),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          mapType: MapType.normal, 
          compassEnabled: true,
      ),
     Positioned(
          bottom: 20,
          right: 15,
          child: 
          IconButton(
            icon: Icon(
              Icons.pin_drop,
              color: Colors.green,
              size: 55,),
            color: Colors.green,
            onPressed: _addGeoPoint,
          )
      ),
  
  //top Bar
      Positioned(
        top: 45,
        left: 7,
        child:new Container(
          margin: const EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
//            border: new Border.all(),
            borderRadius: BorderRadius.circular(9.0),
            color: Colors.white,
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          FlatButton(
            child: Icon(Icons.menu,color: Colors.white,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
            shape: new CircleBorder(),
            color: Colors.green,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            'Select Destination', 
            style:TextStyle(
              color: Colors.green, 
              fontSize: 20.0, 
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 17.0,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.green,
            size: 45.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          ]     
        ),
        ),
      ),
    ]);
  }

  // Map Created Lifecycle Hook
  _onMapCreated(GoogleMapController controller) {
    _startQuery();
    setState(() {
      mapController = controller;
    });
  }


  _animateToUser() async {
    var pos = await location.getLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(pos.latitude, pos.longitude),
          zoom: 17.0,
        )
      )
    );
  }

  // Set GeoLocation Data
  Future<DocumentReference> _addGeoPoint() async {
    var pos = await location.getLocation();
    GeoFirePoint point = geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore.collection('locations').add({ 
      'position': point.data,
      'name': 'Query Updated' 
    });
  }

  void _updateMarkers(List<DocumentSnapshot> documentList) {
    // print(documentList);
    // mapController.clearMarkers();
    // documentList.forEach((DocumentSnapshot document) {
    //     GeoPoint pos = document.data['position']['geopoint'];
    //     double distance = document.data['distance'];
    //     var marker = MarkerOptions(
    //       position: LatLng(pos.latitude, pos.longitude),
    //       icon: BitmapDescriptor.defaultMarker,
    //       infoWindowText: InfoWindowText('Magic Marker', '$distance kilometers from query center')
    //     );


    //     mapController.addMarker(marker);
    // });
  }

  _startQuery() async {
    // Get users location
    var pos = await location.getLocation();
    double lat = pos.latitude;
    double lng = pos.longitude;


    // Make a referece to firestore
    var ref = firestore.collection('locations');
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    // subscribe to query
    subscription = radius.switchMap((rad) {
      return geo.collection(collectionRef: ref).within(
        center: center, 
        radius: rad, 
        field: 'position', 
        strictMode: true
      );
    }).listen(_updateMarkers);
  }


  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }
}
