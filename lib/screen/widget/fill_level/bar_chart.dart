import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../convert_timestamp.dart';

class BarChartCustom extends StatefulWidget {
  @override
  _BarChartCustomState createState() => _BarChartCustomState();
}

class _BarChartCustomState extends State<BarChartCustom> {
  FirebaseApp app;
  int _counter;
  int _last;
  String _caption;
  DatabaseReference _counterRef;
  DatabaseReference _lastUpdate;
  DatabaseReference _messagesRef;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _lastSubscription;
  StreamSubscription<Event> _messagesSubscription;
  // ignore: unused_field
  DatabaseError _error;

  @override
  void initState() {
    super.initState();
    initDB();

// Demonstrates configuring to the database using a file
    _counterRef = FirebaseDatabase.instance.reference().child('Trash1').child('Fill_level');
    _lastUpdate = FirebaseDatabase.instance.reference().child('Trash1').child('Date');

    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    _messagesRef = database.reference().child('messages');
    database.reference().child('counter').once().then((DataSnapshot snapshot) {
      print('Connected to second database and read ${snapshot.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);
    _lastUpdate.keepSynced(true);

    _counterSubscription = _counterRef.onValue.listen((Event event) {
      setState(() {
        _error = null;
        _counter = event.snapshot.value ?? 0;
        if (_counter <= 49) {
          _caption = 'Trash is not full yet';
        } else if (_counter > 49 && _counter < 90) {
          _caption = 'Almost Full, Please Pick Up the Trash';
        } else {
          _caption = 'Trash Bin is Full, Cant Open The Tray';
        }
      });
    }, onError: (Object o) {
      final DatabaseError error = o;
      setState(() {
        _error = error;
      });
    });
    _lastSubscription = _lastUpdate.onValue.listen((Event event) {
      setState(() {
        _error = null;
        _last = event.snapshot.value ?? 0;
      });
    }, onError: (Object o) {
      final DatabaseError error = o;
      setState(() {
        _error = error;
      });
    });
    _messagesSubscription = _messagesRef.limitToLast(10).onChildAdded.listen((Event event) {
      print('Child added: ${event.snapshot.value}');
    }, onError: (Object o) {
      final DatabaseError error = o;
      print('Error: ${error.code} ${error.message}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }

  void initDB() async {
    app = await Firebase.initializeApp(
      name: '',
      options: FirebaseOptions(
        // ignore: deprecated_member_use
        googleAppID: '1:857683442089:android:a1116db73ae975ccbe2cb8',
        apiKey: 'AIzaSyAAezSKqIlZtK8klgNE0rU6llDS5icbDxU',
        databaseURL: 'https://smarttrash-980a7.firebaseio.com',
      ),
    );
  }

  final referenceDatabase = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    String formattedDate = ConvertTimestamp().convertTime(_last);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Text(
          _counter.round().toString() + "%",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: RotatedBox(
            quarterTurns: 0,
            child: LinearPercentIndicator(
              lineHeight: 60.0,
              percent: _counter / 100,
              // center: Text(
              //   (_counter).toString(),
              //   style: TextStyle(
              //     color: Colors.white,
              //   ),
              // ),
              animation: true,
              animationDuration: 500,
              animateFromLastPercent: true,
              progressColor: _counter >= 85 && _counter <= 100
                  ? Colors.red
                  : _counter >= 50 && _counter < 85
                      ? Colors.amber
                      : Colors.green[900],
            ),
          ),
        ),
        Text(
          'Last Update',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 1.0,
        ),
        Text(
          formattedDate,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          _caption,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
