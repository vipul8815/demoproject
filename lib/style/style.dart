import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2A5DE9);
const white = Colors.white;
const black = Colors.black;
const red = Colors.red;
const greyLight = Color(0xFFF1F1F1);
const greyDart = Color(0xFF797979);
const backgorudColor = Color(0xFFF7F9FF);

//------------LatoBlod---------------

TextStyle latoBlodPrimary(fontSize) {
  if (fontSize is int) {
    fontSize = double.parse(fontSize.toStringAsFixed(1));
  }
  return TextStyle(
    fontSize: fontSize,
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'LatoBlod',
  );
}

TextStyle latoBlodGreyDart(fontSize) {
  if (fontSize is int) {
    fontSize = double.parse(fontSize.toStringAsFixed(1));
  }
  return TextStyle(
    fontSize: fontSize,
    color: greyDart,
    fontWeight: FontWeight.bold,
    fontFamily: 'LatoBlod',
  );
}

//------------LatoRegular---------------

TextStyle latoPrimary(fontSize) {
  if (fontSize is int) {
    fontSize = double.parse(fontSize.toStringAsFixed(1));
  }
  return TextStyle(
    fontSize: fontSize,
    color: primaryColor,
    fontFamily: 'LatoBlod',
  );
}

TextStyle latoGreyDart(fontSize) {
  if (fontSize is int) {
    fontSize = double.parse(fontSize.toStringAsFixed(1));
  }
  return TextStyle(
    fontSize: fontSize,
    color: greyDart,
    fontFamily: 'LatoBlod',
  );
}

TextStyle latoWhite(fontSize) {
  if (fontSize is int) {
    fontSize = double.parse(fontSize.toStringAsFixed(1));
  }
  return TextStyle(
    fontSize: fontSize,
    color: white,
    fontFamily: 'LatoBlod',
  );
}

TextStyle latoBlack(fontSize) {
  if (fontSize is int) {
    fontSize = double.parse(fontSize.toStringAsFixed(1));
  }
  return TextStyle(
    fontSize: fontSize,
    color: black,
    fontFamily: 'LatoBlod',
  );
}
