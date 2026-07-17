import '../datasource/hive_service.dart';
import '../models/note_model.dart';

class NoteRepository {
  final HiveService _service = HiveService();

  // GET ALL NOTES
  Future<List<NoteModel>> getNotes() async {
    final box = await _service.openBox();
    return box.values.toList();
  }

  // ADD NOTE
  Future<void> addNote(NoteModel note) async {
    final box = await _service.openBox();
    await box.add(note);
  }

  // UPDATE NOTE
  Future<void> updateNote(NoteModel note) async {
    final box = await _service.openBox();
    final index = box.values.toList().indexWhere(
      (item) => item.id == note.id,
    );
    if (index != -1) {
      await box.putAt(index, note);
    }
  }

  // DELETE Note
  Future<void> deleteNoteById(String id) async {
  final box = await _service.openBox();
  final index = box.values.toList().indexWhere(
    (note) => note.id == id,
  );
  if (index != -1) {
    await box.deleteAt(index);
  }
}

  // FIND NOTE BY ID
  Future<NoteModel?> getNoteById(String id) async {
    final box = await _service.openBox();
    try {
      return box.values.firstWhere(
        (item) => item.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> deleteAllNotes() async {
    await _service.clearBox();
  }
}