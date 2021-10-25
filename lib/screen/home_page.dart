import 'package:demo_app/screen/second_screen.dart';
import 'package:demo_app/services/helper_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/style/style.dart';
import 'package:demo_app/widget/appBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController controller;
  Position? position;
  String? message;
  @override
  void initState() {
    print('ll');
    locationPermission();
    super.initState();
  }

  Future<bool> locationPermission() async {
    bool serviceEnabled, permissionValue = true;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (!serviceEnabled) {
      setState(() {
        message = 'Location services are disabled.';
        permissionValue = false;
      });
      print('Location services are disabled.');
      return false;
    }
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          message = 'Location permissions are denied.';
          permissionValue = false;
        });
        print('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        message =
            'Location permissions are permanently denied, we cannot request permissions.';
        permissionValue = false;
      });
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    if (permissionValue == true) {
      Position positionData = await currentLocation();
      setState(() {
        position = positionData;
      });
    }
    return permissionValue;
  }

  Future<Position> currentLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgorudColor,
      appBar: normalAppBarWithAction('Home Page', context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushNavigator(context, SecondScreen());
        },
        child: Icon(Icons.navigate_next),
      ),
      body: position != null
          ? Container(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(position!.latitude, position!.longitude),
                  zoom: 13.5,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('0'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(position!.latitude, position!.longitude),
                  )
                },
                onMapCreated: (mapcontroller) async {
                  controller = mapcontroller;
                },
              ),
            )
          : Center(child: Text(message ?? '')),
    );
  }
}
