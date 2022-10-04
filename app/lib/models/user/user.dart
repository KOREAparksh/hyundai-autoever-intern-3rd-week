import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String pw;
  String font;
  String lang;
  String color;

  User(this.id, this.name, this.pw, this.font, this.lang, this.color);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, name: $name, pw: $pw, font: $font, lang: $lang, color: $color}';
  }
}
