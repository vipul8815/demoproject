import 'package:flutter/material.dart';

backNavigator(context) {
  Navigator.of(context).pop();
}

pushNavigator(context, route) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => route,
    ),
  );
}

pushAndRemoveUntilNavigator(context, route) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => route,
      ),
      (Route<dynamic> route) => false);
}
