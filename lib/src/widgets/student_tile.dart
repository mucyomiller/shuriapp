import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shuriapp/src/models/bus_stops.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  StudentTile({this.student});
  @override
  Widget build(BuildContext context) {
    String defaultUrl = 'https://avatars1.githubusercontent.com/u/11447549';
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.all(8.0),
        leading: Container(
          width: 45.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(45.0),
            ),
            child: CachedNetworkImage(
              imageUrl: defaultUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Color(0xFF18ACA1),
                ),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/default_avatar.png'),
            ),
          ),
        ),
        title: Text(
          '${student.firstName} ${student.lastName}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        subtitle: Text(
          student.gender,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
