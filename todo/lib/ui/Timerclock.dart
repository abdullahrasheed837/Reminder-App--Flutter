import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

void main() => runApp(Clock());

class Clock extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Clock> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Color.fromARGB(255, 0, 47, 255),
            title: Text('Analog Clock'),
          ),
          backgroundColor: Color.fromARGB(255, 243, 243, 243),
          body: Row(children: [
            AnalogClock(
              decoration: BoxDecoration(
                  border: Border.all(width: 3.0, color: Colors.black),
                  color: Colors.black,
                  shape: BoxShape.circle),
              width: 410.0,
              height: 640.0,
              isLive: true,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              showSecondHand: true,
              numberColor: Colors.white,
              showNumbers: true,
              textScaleFactor: 1.5,
              showTicks: true,
              showDigitalClock: true,
              digitalClockColor: Colors.white,
              datetime: DateTime(2020, 8, 4, 9, 11, 0),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context); // Add your onPressed code here!
            },
            backgroundColor: Color.fromARGB(255, 27, 4, 158),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      );
}
