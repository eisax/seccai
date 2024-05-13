import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
@Entity(tableName: 'listing', indices: [Index(value: ['name'], unique: true)])
class ListingModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;

  ListingModel(
      {this.id,
      required this.name});

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
