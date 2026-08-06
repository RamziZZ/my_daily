import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../widgets/login_header.dart';
import '../widgets/login_illustration.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/login_button.dart';
import '../widgets/register_text.dart';

import '../../../app/routes/app_routes.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: PagePadding(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const LoginHeader(),

                    const SizedBox(height: 30),

                    const LoginIllustration(),

                    const SizedBox(height: 30),

                    const EmailField(),

                    const SizedBox(height: 18),

                    const PasswordField(),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.forgotPassword,
                          );
                        },
                        child: const Text(
                          "Lupa Kata Sandi?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const LoginButton(),

                    const SizedBox(height: 25),

                    const RegisterText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}