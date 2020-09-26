import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuriapp/src/models/student_list.dart';
import 'package:shuriapp/src/services/authentication_service.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

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
                              backgroundColor: Color(0xFF7B68EE),
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
            child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 10.0),
              child: Card(
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesome.graduation_cap,
                                color: Color(0xFF7B68EE),
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Student Name',
                                style: GoogleFonts.fredokaOne(
                                    textStyle: TextStyle(fontSize: 14.0)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesome.user_circle_o,
                                      color: Color(0xFF7B68EE),
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      'Bruce Rindiro',
                                      style: GoogleFonts.rubik(
                                          textStyle: TextStyle(fontSize: 14.0)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1,
                            ),
                            Container(
                              child: Card(
                                color: Colors.yellowAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 5.0),
                                  child: Text('OnBoarding'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      FontAwesome.bus,
                                      color: Color(0xFF7B68EE),
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      'RAA 234P',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      FontAwesome.street_view,
                                      color: Color(0xFF7B68EE),
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      '10 Km',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      MaterialCommunityIcons.alarm,
                                      color: Color(0xFF7B68EE),
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      '20 min',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
