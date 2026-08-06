import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../controllers/add_target_controller.dart';

import '../widgets/add_target_header.dart';
import '../widgets/add_target_image.dart';
import '../widgets/add_target_name_field.dart';
import '../widgets/add_target_time_field.dart';
import '../widgets/add_target_save_button.dart';

class AddTargetPage
    extends GetView<AddTargetController> {
  const AddTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const AddTargetHeader(),

                  const SizedBox(height: 24),

                  const AddTargetImage(),

                  const SizedBox(height: 32),

                  AddTargetNameField(
                    controller:
                        controller.titleController,
                  ),

                  const SizedBox(height: 20),

                  AddTargetTimeField(
                    controller:
                        controller.timeController,
                  ),

                  const SizedBox(height: 40),

                  AddTargetSaveButton(
                    onTap:
                        controller.saveTarget,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}