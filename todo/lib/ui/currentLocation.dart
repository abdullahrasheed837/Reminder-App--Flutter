import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo/ui/home_page.dart';

void main() {
  runApp(myLocation());
}

class myLocation extends StatelessWidget {
  const myLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  State<LocationApp> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lat = position.latitude;
    var long = position.longitude;

    setState(() {
      locationMessage = "Latitude: $lat, Longitude: $long";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 46.0,
                color: Colors.blue,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Get user Location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Position: $locationMessage"),
              ElevatedButton(
                onPressed: () {
                  getCurrentLocation();
                },
                child: Text("Get current location",
                    style: TextStyle(color: Colors.white)),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text(
                    'Back to Home',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    Get.back();
                  },
                ),
              )
            ]),
      ),
    );
  }
}
