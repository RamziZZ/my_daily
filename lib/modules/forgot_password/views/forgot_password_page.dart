import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

import '../widgets/forgot_password_header.dart';
import '../widgets/forgot_password_logo.dart';
import '../widgets/forgot_email_field.dart';
import '../widgets/forgot_password_button.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

class ForgotPasswordPage
    extends GetView<ForgotPasswordController> {

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [

                  const ForgotPasswordHeader(),

                  SizedBox(height: 40),

                  const ForgotPasswordLogo(),

                  SizedBox(height: 40),

                  ForgotPasswordEmailField(
                    controller: controller.emailController,
                    validator: controller.validateEmail,
                  ),

                  Spacer(),

                  Obx(
                    () => ForgotPasswordButton(
                      isLoading: controller.isLoading.value,
                      onTap: controller.sendResetEmail,
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}