import 'package:flutter/material.dart';
import 'package:demo_app/style/style.dart';

primaryBotton(context, text, Function() press) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(onSurface: primaryColor),
      onPressed: press,
      child: Text(
        text ?? '',
        style: latoWhite(12),
      ),
    ),
  );
}

whiteBotton(context, text, Function() press) {
  return Center(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(onSurface: white, primary: white),
      onPressed: press,
      child: Text(
        text ?? '',
        style: latoPrimary(12),
      ),
    ),
  );
}
