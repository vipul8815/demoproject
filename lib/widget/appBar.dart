import 'package:demo_app/screen/auth/login_page.dart';
import 'package:demo_app/services/cache_service.dart';
import 'package:demo_app/services/helper_service.dart';
import 'package:demo_app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/style/style.dart';

normalAppBarWithAction(title, context) {
  return AppBar(
    backgroundColor: primaryColor,
    title: Text(title ?? "", style: latoWhite(16)),
    centerTitle: true,
    actions: [
      SizedBox(width: 10),
      InkWell(
          onTap: () async {
            showToast('Logout successfully...');
            await CacheService.removeLoginData();
            pushAndRemoveUntilNavigator(context, LoginPage());
          },
          child: Icon(Icons.logout)),
      SizedBox(width: 10),
    ],
  );
}

normalAppBar(title) {
  return AppBar(
    backgroundColor: primaryColor,
    centerTitle: true,
    title: Text(title ?? "", style: latoWhite(16)),
  );
}
