import 'package:hive/hive.dart';

part 'target_model.g.dart';

@HiveType(typeId: 1)
class TargetModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String time;

  @HiveField(3)
  bool completed;

  @HiveField(4)
  DateTime createdAt;

  TargetModel({
    required this.id,
    required this.title,
    required this.time,
    this.completed = false,
    required this.createdAt,
  });
}