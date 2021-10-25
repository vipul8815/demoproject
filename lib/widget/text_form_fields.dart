import 'package:flutter/material.dart';
import 'package:demo_app/style/style.dart';

Widget textFormFieldWithContainer(context, title, inputType) {
  return Container(
    decoration: BoxDecoration(
        color: greyLight,
        border: Border.all(color: greyDart, width: 0.1),
        borderRadius: BorderRadius.all(Radius.circular(4))),
    child: textFormField(context, title, inputType),
  );
}

TextFormField textFormField(context, title, inputType) {
  return TextFormField(
    keyboardType: inputType ?? TextInputType.text,
    decoration: InputDecoration(
      labelText: title ?? '',
      labelStyle: latoGreyDart(12),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(width: 0, color: greyDart)),
      errorStyle: TextStyle(color: red),
      contentPadding: EdgeInsets.all(10),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: greyDart, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black),
      ),
    ),
  );
}

Widget textFormFieldWithSearchContainer(context, title, inputType) {
  return Container(
    decoration: BoxDecoration(
        color: greyLight,
        border: Border.all(color: greyDart, width: 0.1),
        borderRadius: BorderRadius.all(Radius.circular(4))),
    child: textFormSearchField(context, title, inputType),
  );
}

TextFormField textFormSearchField(context, title, inputType) {
  return TextFormField(
    enabled: false,
    keyboardType: inputType ?? TextInputType.text,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      labelText: title ?? '',
      labelStyle: latoGreyDart(12),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(width: 0, color: greyDart)),
      errorStyle: TextStyle(color: red),
      contentPadding: EdgeInsets.all(10),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: greyDart, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black),
      ),
    ),
  );
}
