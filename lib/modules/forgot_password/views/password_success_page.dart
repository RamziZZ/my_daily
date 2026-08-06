import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../widgets/back_login_button.dart';
import '../widgets/password_success_icon.dart';
import '../widgets/password_success_text.dart';

class PasswordSuccessPage
    extends StatelessWidget {

  const PasswordSuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: Column(
              children: [

                const Spacer(),

                const PasswordSuccessIcon(),

                const SizedBox(height: 30),

                const PasswordSuccessText(),

                const Spacer(),

                BackLoginButton(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}