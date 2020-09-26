import 'package:flutter/material.dart';

class Moredetails extends StatelessWidget {
  final String data;
  Moredetails({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Horizon Primary School',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${data}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      child: Text(
                        'dffgfg',
                        style: TextStyle(color: Colors.black54),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/homepage',
                            arguments:
                                'How do parents contribute to the development of school');
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
