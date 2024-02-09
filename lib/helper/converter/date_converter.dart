import 'package:floor/floor.dart';
import 'package:intl/intl.dart';
import 'package:seccai/util/extensions.dart';

class DateTimeConverter extends TypeConverter<DateTime, String?> {
  @override
  DateTime decode(String? databaseValue) {
    if(databaseValue!=null){
      return DateTime.parse(databaseValue);
    }else{
      return DateTime.now().getDefaultDate();
    }
  }

  @override
  String encode(DateTime value) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(value) ;
  }
}