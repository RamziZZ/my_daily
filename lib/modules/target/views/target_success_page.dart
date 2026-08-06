import 'package:flutter/material.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../widgets/target_success_header.dart';
import '../widgets/target_success_image.dart';
import '../widgets/target_success_message.dart';
import '../widgets/target_success_button.dart';

class TargetSuccessPage extends StatelessWidget {
  const TargetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: Column(
              children: [

                const TargetSuccessHeader(),

                const Spacer(),

                const TargetSuccessImage(),

                const SizedBox(height: 40),

                const TargetSuccessMessage(),

                const Spacer(),

                const TargetSuccessButton(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}