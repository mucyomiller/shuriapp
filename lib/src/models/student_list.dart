//     final studentList = studentListFromJson(jsonString);

import 'dart:convert';

StudentList studentListFromJson(String str) =>
    StudentList.fromJson(json.decode(str));

String studentListToJson(StudentList data) => json.encode(data.toJson());

class StudentList {
  StudentList({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory StudentList.fromJson(Map<String, dynamic> json) => StudentList(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthday,
    this.profile,
    this.createdAt,
    this.updatedAt,
    this.classroom,
    this.route,
    this.busstop,
    this.schedule,
  });

  String id;
  String firstName;
  String lastName;
  String gender;
  String birthday;
  dynamic profile;
  String createdAt;
  String updatedAt;
  Classroom classroom;
  Route route;
  Busstop busstop;
  Route schedule;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        birthday: json["birthday"],
        profile: json["profile"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        classroom: Classroom.fromJson(json["classroom"]),
        route: Route.fromJson(json["route"]),
        busstop: Busstop.fromJson(json["busstop"]),
        schedule: Route.fromJson(json["schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "birthday": birthday,
        "profile": profile,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "classroom": classroom.toJson(),
        "route": route.toJson(),
        "busstop": busstop.toJson(),
        "schedule": schedule.toJson(),
      };
}

class Busstop {
  Busstop({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.type,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String name;
  String latitude;
  String longitude;
  String type;
  String createdBy;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory Busstop.fromJson(Map<String, dynamic> json) => Busstop(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        type: json["type"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "type": type,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
      };
}

class Classroom {
  Classroom({
    this.id,
    this.name,
    this.code,
    this.avatar,
    this.schoolId,
    this.teacherId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String name;
  String code;
  dynamic avatar;
  String schoolId;
  dynamic teacherId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        avatar: json["avatar"],
        schoolId: json["schoolId"],
        teacherId: json["teacherId"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "avatar": avatar,
        "schoolId": schoolId,
        "teacherId": teacherId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
      };
}

class Route {
  Route({
    this.id,
    this.name,
    this.pathTags,
    this.price,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pickupTime,
    this.dropoffTime,
  });

  String id;
  String name;
  List<String> pathTags;
  String price;
  String createdBy;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String pickupTime;
  String dropoffTime;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        id: json["id"],
        name: json["name"],
        pathTags: json["pathTags"] == null
            ? null
            : List<String>.from(json["pathTags"].map((x) => x)),
        price: json["price"] == null ? null : json["price"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        pickupTime: json["pickupTime"] == null ? null : json["pickupTime"],
        dropoffTime: json["dropoffTime"] == null ? null : json["dropoffTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pathTags": pathTags == null
            ? null
            : List<dynamic>.from(pathTags.map((x) => x)),
        "price": price == null ? null : price,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "pickupTime": pickupTime == null ? null : pickupTime,
        "dropoffTime": dropoffTime == null ? null : dropoffTime,
      };
}
