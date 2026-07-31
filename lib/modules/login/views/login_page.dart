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