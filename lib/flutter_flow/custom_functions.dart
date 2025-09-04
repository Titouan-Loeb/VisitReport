import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String formatNotes(
  String? fullText,
  String? newText,
) {
  String notes = "";
  if (fullText != null) {
    notes = fullText;
    if (newText != null) notes = notes + " " + newText;
  } else if (newText != null) notes = newText;
  return notes;
}

String getLatitute(LatLng location) {
  return location.latitude.toString();
}

String getLongitude(LatLng location) {
  return location.longitude.toString();
}

String formatLocationString(
  String? number,
  String? road,
  String? postcode,
  String? town,
  String? country,
) {
  String location = "";
  if (number != null) {
    location = location + number;
  }
  if (road != null) {
    location = location + ", " + road;
  }
  if (postcode != null) {
    location = location + ", " + postcode;
  }
  if (town != null) {
    location = location + ", " + town;
  }
  if (country != null) {
    location = location + ", " + country;
  }
  return location;
}

int addInt(
  int number1,
  int number2,
) {
  return number1 + number2;
}

String getPictureName(FFUploadedFile image) {
  if (image.name == null) return "";
  return image.name!;
}

int getElementIndex(
  List<String> list,
  String value,
) {
  int index = list.indexOf(value);
  if (index != -1) return index;
  return 0;
}

String getEndlineChar() {
  return '\n';
}

String stringToImagePath(String imagePath) {
  return imagePath;
}

String audioPathToString(String audioPath) {
  return audioPath;
}

String stringToAudioPath(String audioPath) {
  return audioPath;
}

bool is12DaysOld(
  DateTime currentTime,
  DateTime oldTime,
) {
  Duration difference = currentTime.difference(oldTime).abs();

  // Check if the difference is exactly 12 days
  if (difference.inSeconds > 12) {
    return true;
  } else {
    return false;
  }
}

String getElapsedTimeString(DateTime timestamp) {
  DateTime endDate = DateTime.now();
  Duration difference = endDate.difference(timestamp).abs();
  if (difference.inSeconds < 60) {
    return 'il y a ${difference.inSeconds} seconde(s)';
  } else if (difference.inMinutes < 60) {
    return 'il y a ${difference.inMinutes} minute(s)';
  } else if (difference.inHours < 24) {
    return 'il y a ${difference.inHours} heure(s)';
  } else if (difference.inDays < 30) {
    return 'il y a ${difference.inDays} jour(s)';
  } else if (difference.inDays < 365) {
    int months = difference.inDays ~/ 30;
    return 'il y a $months month(s)';
  } else {
    int years = difference.inDays ~/ 365;
    return 'il y a $years an(s)';
  }
}
