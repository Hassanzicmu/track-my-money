import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'icon_mapper.dart';

class IconDataConverter implements JsonConverter<IconData, int> {
  const IconDataConverter();

  @override
  IconData fromJson(int json) {
    return IconMapper.getIcon(json);
  }

  @override
  int toJson(IconData object) => object.codePoint;
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}