import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuriapp/src/models/student_list.dart';
import 'package:shuriapp/src/services/authentication_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mapStyle;
  final LatLng _center = const LatLng(-1.967165, 30.103201);
  GoogleMapController mapController;
  Future<StudentList> studentList;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    studentList = getStudentList();
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
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
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
                              'Student 1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      );
                    }),
              )),
          // FutureBuilder<StudentList>(
          //   future: studentList,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Positioned(
          //           top: 0,
          //           left: 0,
          //           right: 0,
          //           child: Container(
          //             color: Colors.white54,
          //             height: MediaQuery.of(context).size.shortestSide * 0.25,
          //             child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemCount: snapshot.data.data.length,
          //                 itemBuilder: (context, index) {
          //                   return Container(
          //                     width: 100.0,
          //                     color: Colors.transparent,
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceEvenly,
          //                       children: <Widget>[
          //                         CircleAvatar(
          //                           radius: 25,
          //                           backgroundColor:
          //                               Theme.of(context).primaryColor,
          //                           child: CircleAvatar(
          //                             backgroundImage: AssetImage(
          //                                 'assets/default_avatar.png'),
          //                             radius: 22,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data.data[index].firstName,
          //                           style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                               color: Colors.black),
          //                         )
          //                       ],
          //                     ),
          //                   );
          //                 }),
          //           ));
          //     } else if (snapshot.hasError) {}
          //     return SpinKitDoubleBounce(
          //       color: Theme.of(context).primaryColor,
          //     );
          //   },
          // ),
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
                            'Bruce ',
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
                            Text('bus plate'),
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
