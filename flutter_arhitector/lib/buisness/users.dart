// ignore_for_file: unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    int? age,
  }) = _User;
}
