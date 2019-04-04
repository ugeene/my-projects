import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  GoogleMapController mapController;
  Location location =Location();

  Marker marker;

  @override
  void initState() { 
    super.initState();
    location.onLocationChanged().listen((location) async{
      if(marker !=null) {
        mapController.removeMarker(marker);
      }
      marker = await mapController?.addMarker(MarkerOption(
        position:LatLng(location["latitute"], location["longitute"]),
      ));
      mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              location["latitude"],
              location["longitude"]
              ),
            zoom: 20.0,
          ),
        ),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,

              onMapCreated: (GoogleMapController controller){
                mapController =controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(37.4219999, -122.0862462),
              ),
               myLocationEnabled:true,
              ),
          ),
        ],
      ),      
    );
  }


}
