import 'package:get/get.dart';
import '../../../data/models/target_model.dart';
import '../../../data/repositories/target_repository.dart';

class TargetController extends GetxController {

  final repository = TargetRepository();

  RxList<TargetModel> targets =
      <TargetModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTargets();
  }

  Future<void> loadTargets() async {
    targets.value =
        await repository.getTargets();
  }

  Future<void> toggleTarget(
      TargetModel target) async {

    target.completed =
        !target.completed;

    await repository.updateTarget(target);

    await loadTargets();
  }

  Future<void> deleteTarget(String id) async {
    await repository.deleteTarget(id);
    await loadTargets();
  }

  int get total => targets.length;

  int get completed =>
      targets.where((e) => e.completed).length;

  int get pending =>
      targets.where((e) => !e.completed).length;
}