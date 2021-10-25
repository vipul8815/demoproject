import 'package:demo_app/constants.dart';
import 'package:demo_app/screen/home_page.dart';
import 'package:demo_app/services/cache_service.dart';
import 'package:demo_app/style/style.dart';
import 'package:demo_app/widget/appBar.dart';
import 'package:demo_app/widget/button.dart';
import 'package:demo_app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/screen/auth/registration.dart';
import 'package:demo_app/services/helper_service.dart';
import 'package:demo_app/widget/text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKeyForLogin = GlobalKey<FormState>();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgorudColor,
      appBar: normalAppBar('Login Page'),
      body: Form(
        key: _formKeyForLogin,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              SizedBox(height: 100),
              textFormFieldWithContainerEmail(context, 'Email'),
              SizedBox(height: 30),
              textFormFieldWithContainerPassword(context, 'Password'),
              SizedBox(height: 10),
              primaryBotton(context, 'Sign In', () {
                loginMethod();
              }),
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textLatoGreyDart(context, 'Dont have account?', 12),
                  SizedBox(height: 10),
                  textlatoBlodPrimary(context, "Sign up", 12, onPress: () {
                    pushNavigator(context, RegistrationPage());
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormFieldWithContainerEmail(context, title) {
    return Container(
      decoration: BoxDecoration(
          color: greyLight,
          border: Border.all(color: greyDart, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: TextFormField(
        onSaved: (String? value) {
          email = value;
        },
        validator: (String? value) {
          if (!RegExp(Constants.emailValidation).hasMatch(value!)) {
            return "Enter valid email id...";
          } else
            return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: title ?? '',
          labelStyle: latoGreyDart(12),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: greyDart)),
          errorStyle: TextStyle(color: red),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: greyDart, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldWithContainerPassword(context, title) {
    return Container(
      decoration: BoxDecoration(
          color: greyLight,
          border: Border.all(color: greyDart, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: TextFormField(
        onSaved: (String? value) {
          password = value;
        },
        validator: (String? value) {
          if (value!.length < 6) {
            return 'Enter min 6 digits password...';
          } else
            return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: title ?? '',
          labelStyle: latoGreyDart(12),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: greyDart)),
          errorStyle: TextStyle(color: red),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: greyDart, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
        ),
      ),
    );
  }

  loginMethod() async {
    final form = _formKeyForLogin.currentState!;
    if (form.validate()) {
      form.save();
      List? list = await CacheService.getUserData();
      final result = list?.any((element) =>
          email == element['email'] && password == element['password']);
      if (result == true) {
        showToast('Login successfully...');
        var body = {'email': email, 'password': password};
        CacheService.setLoginData(body);
        pushAndRemoveUntilNavigator(context, HomePage());
      } else {
        showToast('Enter valid email/password');
      }
    }
  }
}
