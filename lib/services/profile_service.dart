import 'dart:convert';
import 'dart:io';

import 'package:flutter_a/services/login_services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getProfile() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = await prefs.getString('token') ?? "nothing";
    String authHeader = token;
    var response = await http.get('$baseeURl/api/auth/user', headers: {
      'Authorization': 'Bearer $authHeader',
      HttpHeaders.contentTypeHeader: "application/json"
    });

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    e.toString();
  }
}

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.country,
    this.bio,
    this.city,
    this.address,
    this.lat,
    this.lng,
    this.emailVerifiedAt,
    this.type,
    this.isActive,
    this.isBlocked,
    this.expiryDate,
    this.profilePicture,
    this.coverPicture,
    this.rights,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String username;
  String email;
  dynamic phone;
  dynamic country;
  dynamic bio;
  dynamic city;
  dynamic address;
  dynamic lat;
  dynamic lng;
  dynamic emailVerifiedAt;
  String type;
  int isActive;
  int isBlocked;
  dynamic expiryDate;
  dynamic profilePicture;
  dynamic coverPicture;
  dynamic rights;
  dynamic createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"],
        country: json["country"],
        bio: json["bio"],
        city: json["city"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
        emailVerifiedAt: json["email_verified_at"],
        type: json["type"] == null ? null : json["type"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        isBlocked: json["isBlocked"] == null ? null : json["isBlocked"],
        expiryDate: json["expiry_date"],
        profilePicture: json["profile_picture"],
        coverPicture: json["cover_picture"],
        rights: json["rights"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "phone": phone,
        "country": country,
        "bio": bio,
        "city": city,
        "address": address,
        "lat": lat,
        "lng": lng,
        "email_verified_at": emailVerifiedAt,
        "type": type == null ? null : type,
        "isActive": isActive == null ? null : isActive,
        "isBlocked": isBlocked == null ? null : isBlocked,
        "expiry_date": expiryDate,
        "profile_picture": profilePicture,
        "cover_picture": coverPicture,
        "rights": rights,
        "created_by": createdBy,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
