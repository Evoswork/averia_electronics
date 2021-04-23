import 'package:flutter/material.dart';

/// Стили текстов
final TextStyle _text = const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
    ),

//Regular
//Medium
    textMedium = _text.copyWith(fontWeight: FontWeight.w500),
// 14
    textMedium14 = textMedium.copyWith(fontSize: 14.0),
// 20
    textMedium20 = textMedium.copyWith(fontSize: 20.0);
