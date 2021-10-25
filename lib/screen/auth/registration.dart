import 'package:demo_app/constants.dart';
import 'package:demo_app/services/cache_service.dart';
import 'package:demo_app/services/helper_service.dart';
import 'package:demo_app/style/style.dart';
import 'package:demo_app/widget/appBar.dart';
import 'package:demo_app/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/widget/button.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? email, password, name, number;
  final GlobalKey<FormState> _formKeyForSignUp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgorudColor,
      appBar: normalAppBar('Sign Up Page'),
      body: Form(
        key: _formKeyForSignUp,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              SizedBox(height: 90),
              textFormFieldWithContainerName(context, 'Full Name'),
              SizedBox(height: 30),
              textFormFieldWithContainerEmail(context, 'Email'),
              SizedBox(height: 30),
              textFormFieldWithContainerPassword(context, 'Password'),
              SizedBox(height: 30),
              textFormFieldWithContainerNumber(context, 'Mobile Number'),
              SizedBox(height: 30),
              primaryBotton(context, 'SUBMIT', () {
                signUpMethod();
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormFieldWithContainerName(context, title) {
    return Container(
      decoration: BoxDecoration(
          color: greyLight,
          border: Border.all(color: greyDart, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: TextFormField(
        onSaved: (String? value) {
          name = value;
        },
        validator: (String? value) {
          if (value!.isEmpty) {
            return "Enter full name...";
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

  Widget textFormFieldWithContainerNumber(context, title) {
    return Container(
      decoration: BoxDecoration(
          color: greyLight,
          border: Border.all(color: greyDart, width: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: TextFormField(
        onSaved: (String? value) {
          number = value;
        },
        validator: (String? value) {
          if (!RegExp(Constants.numberValidation).hasMatch(value!)) {
            return 'Enter mobile number...';
          } else
            return null;
        },
        keyboardType:
            TextInputType.numberWithOptions(signed: false, decimal: false),
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

  signUpMethod() async {
    final form = _formKeyForSignUp.currentState!;
    if (form.validate()) {
      form.save();
      List? list = await CacheService.getUserData();
      final result = list?.any((element) =>
          email == element['email'] || number == element['number']);
      if (result == true) {
        showToast(
            'Email/mobile number already registered, please enter diff email/mobile number');
      } else {
        var body = {
          'email': email,
          'password': password,
          'number': number,
          'name': name
        };
        CacheService.setUser(body);
        showToast('Registration successfully...');
        backNavigator(context);
      }
    }
  }
}
