// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) => HotelPreview(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelInfo _$HotelInfoFromJson(Map<String, dynamic> json) => HotelInfo(
      (json['price'] as num).toDouble(),
      (json['rating'] as num).toDouble(),
      AddressInfo.fromJson(json['address'] as Map<String, dynamic>),
      ServisesInfo.fromJson(json['services'] as Map<String, dynamic>),
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$HotelInfoToJson(HotelInfo instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'price': instance.price,
      'rating': instance.rating,
      'photos': instance.photos,
      'address': instance.address.toJson(),
      'services': instance.services.toJson(),
    };

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) => AddressInfo(
      json['country'] as String,
      json['street'] as String,
      json['city'] as String,
    );

Map<String, dynamic> _$AddressInfoToJson(AddressInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
    };

ServisesInfo _$ServisesInfoFromJson(Map<String, dynamic> json) => ServisesInfo(
      (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServisesInfoToJson(ServisesInfo instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
