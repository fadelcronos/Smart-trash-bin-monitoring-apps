import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:signIn/models/data_timestap.dart';
import 'package:signIn/screen/widget/convert_timestamp.dart';

import '../table_basic.dart';

class FillLog extends StatefulWidget {
  @override
  _FillLogState createState() => _FillLogState();
}

class _FillLogState extends State<FillLog> {
  List<DataTimestamp> dataList = [];
  void initState() {
    super.initState();
    DatabaseReference referenceData = FirebaseDatabase.instance.reference().child('TimeStamp');
    referenceData.orderByChild('Date').once().then((DataSnapshot dataSnapshot) {
      // print('+++++++++++++++++++++++++');
      // print(dataSnapshot.value.keys);
      // print('+++++++++++++++++++++++++');
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      var key;
      for (key in keys) {
        DataTimestamp data = new DataTimestamp(
          values[key]['Date'],
          values[key]['Fill_level'],
          values[key]['Odor'],
        );
        dataList.add(data);
      }
      dataList.sort((a, b) {
        var dateA = a.dateTime;
        var dateB = b.dateTime;
        return -dateA.compareTo(dateB);
      });
      print(dataList);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime now = new DateTime.(112211123);
    return SingleChildScrollView(
      child: Column(
        children: [
          Table(
            border: TableBorder(
                bottom: BorderSide(
              width: 1.0,
              color: Colors.white,
            )),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Date Time',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Value',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Table(
            children: dataList.map((e) {
              String formattedDate = ConvertTimestamp().convertTime(e.dateTime);
              return TableRowBasic().render(
                tableHead: Text(
                  formattedDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                tableCell: Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text(
                    e.fillLevel.toString() + ' %',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
