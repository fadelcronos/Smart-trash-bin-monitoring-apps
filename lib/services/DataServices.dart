// import 'package:firebase_database/firebase_database.dart';
// import 'package:signIn/models/data_timestap.dart';

// class DataService {
//   static Future<List<DataTimestamp>> getData() async {
//     List<DataTimestamp> dataList = [];

//     DatabaseReference getDataSnapshot = await FirebaseDatabase.instance.reference().child('TimeStamp');
//     getDataSnapshot.once().then((DataSnapshot dataSnapshot) {
//       var keys = dataSnapshot.value.key;
//       var values = dataSnapshot.value;

//       for (var key in keys) {
//         DataTimestamp data = new DataTimestamp(
//           fillLevel: values[key]['Fill_level'],
//           odor: values[key]['Odor'],
//           dateTime: values[key]['Date'],
//         );
//         dataList.add(data);
//       }
//     });
//     print(dataList);
//     return dataList;
//   }
// }
