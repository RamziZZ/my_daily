import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

import '../widgets/mood_selector.dart';
import '../widgets/save_button.dart';

import 'package:my_daily/modules/add_note/widgets/add_activity_header.dart';
import 'package:my_daily/modules/add_note/widgets/activity_category_grid.dart';
import 'package:my_daily/modules/add_note/widgets/activity_name_field.dart';
import 'package:my_daily/modules/add_note/widgets/activity_date_picker.dart';
import 'package:my_daily/modules/add_note/widgets/activity_time_picker.dart';

import 'package:my_daily/app/widgets/app_background.dart';
import 'package:my_daily/app/widgets/page_padding.dart';

class AddNotePage extends GetView<AddNoteController> {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: PagePadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddActivityHeader(),

                SizedBox(height: 24),

                ActivityCategoryGrid(),

                SizedBox(height: 24),

                ActivityNameField(),

                SizedBox(height: 16),

                ActivityDatePicker(),

                SizedBox(height: 16),

                ActivityTimePicker(),

                SizedBox(height: 24),

                MoodSelector(),

                SizedBox(height: 32),

                SaveButton(
                  onTap: controller.saveNote,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}