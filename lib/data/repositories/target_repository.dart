import 'package:hive/hive.dart';
import '../models/target_model.dart';

class TargetRepository {

  Future<Box<TargetModel>> _openBox() async {
    return await Hive.openBox<TargetModel>('targets');
  }

  Future<List<TargetModel>> getTargets() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addTarget(TargetModel target) async {
    final box = await _openBox();
    await box.add(target);
  }

  Future<void> deleteTarget(String id) async {
    final box = await _openBox();

    final key = box.keys.firstWhere(
      (k) => box.get(k)?.id == id,
      orElse: () => null,
    );

    if (key != null) {
      await box.delete(key);
    }
  }

  Future<void> updateTarget(TargetModel target) async {
    final box = await _openBox();

    final key = box.keys.firstWhere(
      (k) => box.get(k)?.id == target.id,
      orElse: () => null,
    );

    if (key != null) {
      await box.put(key, target);
    }
  }
}