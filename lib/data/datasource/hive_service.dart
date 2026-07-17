import 'package:hive/hive.dart';
import '../models/note_model.dart';

class HiveService {
  static const String boxName = "notes";

  Future<Box<NoteModel>> openBox() async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<NoteModel>(boxName);
    }

    return await Hive.openBox<NoteModel>(boxName);
  }

  Future<void> clearBox() async {
    final box = await openBox();
    await box.clear();
  }
}