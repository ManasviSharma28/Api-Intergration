// To parse this JSON data, do
//
//     final sampleApi = sampleApiFromJson(jsonString);

/*import 'dart:convert';

List<SampleApi> sampleApiFromJson(String str) =>
    List<SampleApi>.from(json.decode(str).map((x) => SampleApi.fromJson(x)));

String sampleApiToJson(List<SampleApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleApi {
  int userId;
  int id;
  String title;
  String body;

  SampleApi({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory SampleApi.fromJson(Map<String, dynamic> json) => SampleApi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}*/
// To parse this JSON data, do
//
//     final sampleApii = sampleApiiFromJson(jsonString);

import 'dart:convert';

List<SampleApii> sampleApiiFromJson(String str) =>
    List<SampleApii>.from(json.decode(str).map((x) => SampleApii.fromJson(x)));

String sampleApiiToJson(List<SampleApii> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleApii {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  SampleApii({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory SampleApii.fromJson(Map<String, dynamic> json) => SampleApii(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
