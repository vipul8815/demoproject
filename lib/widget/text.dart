import 'package:flutter/material.dart';
import 'package:demo_app/style/style.dart';

Widget textlatoBlodPrimary(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress,
      child: Text(title ?? "", style: latoBlodPrimary(fontSize)));
}

Widget textLatoGreyDartCenterHight30(context, title, fontSize,
    {Function()? onPress}) {
  return InkWell(
      onTap: onPress,
      child: Container(
          height: 30,
          child: Text(title ?? "",
              textAlign: TextAlign.center, style: latoGreyDart(fontSize))));
}

Widget textLatoGreyDartCenter(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress,
      child: Text(title ?? "",
          textAlign: TextAlign.center, style: latoGreyDart(fontSize)));
}

Widget textLatoGreyDart(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress, child: Text(title ?? "", style: latoGreyDart(fontSize)));
}

Widget textWithCheckbox(context, title, Widget checkBoxWidget) {
  return Row(
      children: [checkBoxWidget, textLatoGreyDart(context, title ?? "", 12)]);
}

Widget textlatoBlodGreyDart(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress,
      child: Text(title ?? "", style: latoBlodGreyDart(fontSize)));
}

Widget richTextTitle(context, title1, title2) {
  return RichText(
    text: TextSpan(
      text: title1,
      style: latoGreyDart(12),
      children: <TextSpan>[
        TextSpan(text: " ${title2 ?? ""}", style: latoPrimary(12)),
      ],
    ),
  );
}

buildDivider({height = 20.0, thickness = 1.0}) {
  return Divider(
    color: black,
    height: height,
    thickness: thickness,
  );
}

Widget textlatoBlackCenter(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress,
      child: Text(title ?? "",
          textAlign: TextAlign.center, style: latoBlack(fontSize)));
}

Widget textlatoBlack(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress, child: Text(title ?? "", style: latoBlack(fontSize)));
}

Widget textLatoWhite(context, title, fontSize, {Function()? onPress}) {
  return InkWell(
      onTap: onPress, child: Text(title ?? "", style: latoWhite(fontSize)));
}
