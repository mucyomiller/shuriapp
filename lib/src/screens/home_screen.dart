import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mapStyle;
  final LatLng _center = const LatLng(-1.967165, 30.103201);
  GoogleMapController mapController;

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          GoogleMap(
            trafficEnabled: false,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white54,
                height: MediaQuery.of(context).size.shortestSide * 0.25,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/default_avatar.png'),
                              radius: 22,
                            ),
                          ),
                          Text(
                            'Joe',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage('assets/default_avatar.png'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(
                            'Brandon',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage('assets/default_avatar.png'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(
                            'Terry',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage('assets/default_avatar.png'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(
                            'Susanna',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Mucyo Miller',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          VerticalDivider(
                            thickness: 1,
                          ),
                          Text('OnBoarding')
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('bus plaate'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'RAA 234P',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Distance'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Distance',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Time'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Time',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
