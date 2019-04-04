import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class About extends StatelessWidget {

  GoogleMapController mapController;

  @override
  Widget build (BuildContext context) => new Scaffold(
    
    //App Bar
    appBar: new AppBar(
      title: new Text(
        'About', 
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body: new PageView(
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
               myLocationEnabled: true,
              ),
          ),
      ],
    ),
    floatingActionButton: new FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.account_box),
    ),
  );
}