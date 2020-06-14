// To parse this JSON data, do
//
//     final busStops = busStopsFromJson(jsonString);

import 'dart:convert';

BusStops busStopsFromJson(String str) => BusStops.fromJson(json.decode(str));

String busStopsToJson(BusStops data) => json.encode(data.toJson());

class BusStops {
  String message;
  Data data;

  BusStops({
    this.message,
    this.data,
  });

  factory BusStops.fromJson(Map<String, dynamic> json) => BusStops(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<BusStop> busStops;
  int totalBusStops;

  Data({
    this.busStops,
    this.totalBusStops,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        busStops: List<BusStop>.from(
            json["busStops"].map((x) => BusStop.fromJson(x))),
        totalBusStops: json["totalBusStops"],
      );

  Map<String, dynamic> toJson() => {
        "busStops": List<dynamic>.from(busStops.map((x) => x.toJson())),
        "totalBusStops": totalBusStops,
      };
}

class BusStop {
  String id;
  String name;
  String latitude;
  String longitude;
  String type;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Student> students;

  BusStop({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.type,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.students,
  });

  factory BusStop.fromJson(Map<String, dynamic> json) => BusStop(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        type: json["type"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "type": type,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };
}

class Student {
  String id;
  String firstName;
  String lastName;
  String gender;
  String birthday;
  dynamic profile;
  DateTime createdAt;
  DateTime updatedAt;
  List<Guardian> guardians;

  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.birthday,
    this.profile,
    this.createdAt,
    this.updatedAt,
    this.guardians,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        birthday: json["birthday"],
        profile: json["profile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        guardians: List<Guardian>.from(
            json["guardians"].map((x) => Guardian.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "birthday": birthday,
        "profile": profile,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "guardians": List<dynamic>.from(guardians.map((x) => x.toJson())),
      };
}

class Guardian {
  String id;
  String names;
  String phoneNumber;
  String roleId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  StudentGuardian studentGuardian;

  Guardian({
    this.id,
    this.names,
    this.phoneNumber,
    this.roleId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGuardian,
  });

  factory Guardian.fromJson(Map<String, dynamic> json) => Guardian(
        id: json["id"],
        names: json["names"],
        phoneNumber: json["phoneNumber"],
        roleId: json["roleId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        studentGuardian: StudentGuardian.fromJson(json["StudentGuardian"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "names": names,
        "phoneNumber": phoneNumber,
        "roleId": roleId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "StudentGuardian": studentGuardian.toJson(),
      };
}

class StudentGuardian {
  String id;
  String studentId;
  String guardianId;
  String relationship;
  String schoolId;
  String classroomId;
  String routeId;
  String busstopId;
  String driverId;
  String busId;
  String partnershipI;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  StudentGuardian({
    this.id,
    this.studentId,
    this.guardianId,
    this.relationship,
    this.schoolId,
    this.classroomId,
    this.routeId,
    this.busstopId,
    this.driverId,
    this.busId,
    this.partnershipI,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory StudentGuardian.fromJson(Map<String, dynamic> json) =>
      StudentGuardian(
        id: json["id"],
        studentId: json["studentId"],
        guardianId: json["guardianId"],
        relationship: json["relationship"],
        schoolId: json["schoolId"],
        classroomId: json["classroomId"],
        routeId: json["routeId"],
        busstopId: json["busstopId"],
        driverId: json["driverId"],
        busId: json["busId"],
        partnershipI: json["partnershipI"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "studentId": studentId,
        "guardianId": guardianId,
        "relationship": relationship,
        "schoolId": schoolId,
        "classroomId": classroomId,
        "routeId": routeId,
        "busstopId": busstopId,
        "driverId": driverId,
        "busId": busId,
        "partnershipI": partnershipI,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
