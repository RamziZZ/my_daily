import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {

  @HiveField(0)
  String id;

  @HiveField(1)
  String activity;

  @HiveField(2)
  String note;

  @HiveField(3)
  String mood;

  @HiveField(4)
  String priority;

  @HiveField(5)
  DateTime date;

  @HiveField(6)
  String time;

  NoteModel({
    required this.id,
    required this.activity,
    required this.note,
    required this.mood,
    required this.priority,
    required this.date,
    required this.time,
  });

}