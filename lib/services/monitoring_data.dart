// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';

// class MonitorData {
//   FirebaseApp app;
//   int _counter;
//   DatabaseReference _counterRef;
//   DatabaseReference _messagesRef;
//   StreamSubscription<Event> _counterSubscription;
//   StreamSubscription<Event> _messagesSubscription;
//   DatabaseError _error;

//   @override
//   void initState() {
//     super.initState();
//     initDB();

// // Demonstrates configuring to the database using a file
//     _counterRef = FirebaseDatabase.instance.reference().child('Trash1').child('Fill_level');
//     // Demonstrates configuring the database directly
//     final FirebaseDatabase database = FirebaseDatabase(app: app);
//     _messagesRef = database.reference().child('messages');
//     database.reference().child('counter').once().then((DataSnapshot snapshot) {
//       print('Connected to second database and read ${snapshot.value}');
//     });
//     database.setPersistenceEnabled(true);
//     database.setPersistenceCacheSizeBytes(10000000);
//     _counterRef.keepSynced(true);
//     _counterSubscription = _counterRef.onValue.listen((Event event) {
//       setState(() {
//         _error = null;
//         _counter = event.snapshot.value ?? 0;
//       });
//     }, onError: (Object o) {
//       final DatabaseError error = o;
//       setState(() {
//         _error = error;
//       });
//     });
//     _messagesSubscription = _messagesRef.limitToLast(10).onChildAdded.listen((Event event) {
//       print('Child added: ${event.snapshot.value}');
//     }, onError: (Object o) {
//       final DatabaseError error = o;
//       print('Error: ${error.code} ${error.message}');
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _messagesSubscription.cancel();
//     _counterSubscription.cancel();
//   }

//   void initDB() async {
//     app = await Firebase.initializeApp(
//       name: '',
//       options: FirebaseOptions(
//         // ignore: deprecated_member_use
//         googleAppID: '1:857683442089:android:a1116db73ae975ccbe2cb8',
//         apiKey: 'AIzaSyAAezSKqIlZtK8klgNE0rU6llDS5icbDxU',
//         databaseURL: 'https://smarttrash-980a7.firebaseio.com',
//       ),
//     );
//   }

//   final referenceDatabase = FirebaseDatabase.instance.reference();
// }
