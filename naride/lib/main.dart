import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nitaride',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Image capture variable
  File _image;
  
  // Geolocator variables
  Geolocator geolocator = Geolocator();
  Position userLocation;
  LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  //Trying the position type argument
  List<Position> locations = [];
  StreamSubscription<Position> streamSubscription;

  bool trackLocation =false;

  // google_maps_flutter variables
  Completer<GoogleMapController> _controller = Completer();
  Marker marker;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.image),
                title: new Text('Picture'),
                onTap: () => getImage()          
              ),
              new ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () => {}          
              ),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () => {},          
              ),
              new Divider(),
            ],
          ),
        );
      }
    );
}

  void _showMessage(String _titleText, String _bodyText) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_titleText),
          content: new Container(width: 150.0,
            height: 30.0,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius:
              new BorderRadius.all(new Radius.circular(10.0)),
            ),
            child: new Text(_bodyText),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {

    super.initState();
    _getLocation().then((position) {
      userLocation = position;
    });
  }

    Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  static final CameraPosition _kisumuTown = CameraPosition(
    target: LatLng(-0.0917, 34.7680),
    zoom: 12,
  );

  getLocations() {
    if (trackLocation) {
      setState(() {
       trackLocation = false;
      });
      streamSubscription.cancel();
      streamSubscription =null;
    } else {
      setState(() {
       trackLocation =true; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('Meme'),
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
                title: Text('Become a Rider'),
                onTap: () {
                  _showMessage("Become a Rider", "This feature is coming in the next update");
                },
              ),
            ],
          ), 
          
        ),
        
        body: Column(
          children: <Widget>[
            
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kisumuTown,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                compassEnabled: true,
              ),
            ),
          ],

          // child: _image == null
          //     ? Text('No image selected.')
          //     : Image.file(_image),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){_settingModalBottomSheet(context);},
          tooltip: 'Select Destination',
          child: Icon(Icons.location_on),
        ), 

    );
  }
}
