import 'dart:convert';

extension DateUtil on DateTime {
  DateTime getDefaultDate() {
    return DateTime.utc(1990, 07, 17);
  }
}

extension ListBoolJson on List {
  String listToJson() {
    return jsonEncode(this);
  }

  List<List<bool>> listFromJson(String json) {
    List<List<bool>> list = [] ;
    return list;
  }
}