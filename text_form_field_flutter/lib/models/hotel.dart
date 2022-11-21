import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({required this.uuid, required this.name, required this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

Future<List<HotelPreview>> getDataHotels() async {
  //Future <List<HotelPreview>> hotelslist;

  const url = 'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<HotelPreview> hotelsList = [];
    final hotelsListJson = json.decode(response.body);
    print(hotelsListJson);

    for (var i = 0; i < hotelsListJson.length; i++) {
      final previw = HotelPreview.fromJson(hotelsListJson[i]);
      hotelsList.add(previw);
    }
    return hotelsList;
  } else {
    throw Exception('Error ${response.reasonPhrase}');
  }
}

@JsonSerializable(explicitToJson: true)
class HotelInfo {
  final String uuid;
  final String name;
  final String poster;
  final double price;
  final double rating;
  final List<String> photos;
  final AddressInfo address;
  final ServisesInfo services;

  HotelInfo(this.price, this.rating, this.address, this.services, this.photos,
      {required this.uuid, required this.name, required this.poster});

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}

Future<HotelInfo> getDataHotelInfo(String uuid) async {
  //Future <List<HotelPreview>> hotelslist;

  final url = 'https://run.mocky.io/v3/${uuid}';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    HotelInfo hotelInfo = HotelInfo.fromJson(json.decode(response.body));
    return hotelInfo;
  } else {
    throw Exception('Error ${response.reasonPhrase}');
  }
}

@JsonSerializable(explicitToJson: true)
class AddressInfo {
  final String country;
  final String street;
  final String city;

  AddressInfo(this.country, this.street, this.city);
  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AddressInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ServisesInfo {
  final List<String> free;
  final List<String> paid;

  ServisesInfo(this.free, this.paid);

  factory ServisesInfo.fromJson(Map<String, dynamic> json) =>
      _$ServisesInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ServisesInfoToJson(this);
}
