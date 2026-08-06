import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_daily/app/routes/app_routes.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/target_model.dart';
import '../../../data/repositories/target_repository.dart';

class AddTargetController extends GetxController {

  final titleController =
      TextEditingController();

  final timeController =
      TextEditingController();

  final repository =
      TargetRepository();

  final uuid = const Uuid();

  Future<void> saveTarget() async {

    if (titleController.text.isEmpty) {
      return;
    }

    final target = TargetModel(
      id: uuid.v4(),
      title: titleController.text,
      time: timeController.text,
      createdAt: DateTime.now(),
    );

    await repository.addTarget(target);

    Get.offNamed(
      AppRoutes.targetSuccess,
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    timeController.dispose();
    super.onClose();
  }
}