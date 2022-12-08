import 'package:crendly/app/constants/color_palette.dart';
import 'package:flutter/material.dart';

class ClearIcon{
  get showClearIcon => Container(
      height: 20, width: 20, decoration: BoxDecoration(
      shape: BoxShape.circle, color: kRedPink
  ),child: Icon(Icons.clear, color: kWhite, size: 15,));
}