import 'package:intl/intl.dart';

class ConvertTimestamp {
  String convertTime(int timeInMills) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMills);
    var formattedDate = DateFormat.yMMMEd().add_Hms().format(date);

    return formattedDate;
  }
}
