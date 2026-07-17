import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_daily/data/models/note_model.dart';

class HiveService {
  static const String boxName = "notes";

  Future<Box<NoteModel>> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<NoteModel>(boxName);
    }

    return Hive.box<NoteModel>(boxName);
  }

  Future<void> clearBox() async {
    final box = await openBox();
    await box.clear();
  }
}