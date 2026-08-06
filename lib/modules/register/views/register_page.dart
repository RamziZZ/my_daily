import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../controllers/register_controller.dart';

import '../widgets/register_header.dart';
import '../widgets/register_title.dart';
import '../widgets/register_name_field.dart';
import '../widgets/register_email_field.dart';
import '../widgets/register_password_field.dart';
import '../widgets/register_confirm_password_field.dart';
import '../widgets/register_button.dart';
import '../widgets/register_login_link.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: Form(
              key: controller.formKey,
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      const RegisterHeader(),

                      const SizedBox(height: 40),

                      const RegisterTitle(),

                      const SizedBox(height: 50),

                      RegisterNameField(
                        controller:
                            controller.usernameController,
                        validator:
                            controller.validateUsername,
                      ),

                      const SizedBox(height: 20),

                      RegisterEmailField(
                        controller:
                            controller.emailController,
                        validator:
                            controller.validateEmail,
                      ),

                      const SizedBox(height: 20),

                      RegisterPasswordField(
                        controller:
                            controller.passwordController,
                        validator:
                            controller.validatePassword,
                        obscure:
                            controller.obscurePassword.value,
                        onToggle:
                            controller.togglePassword,
                      ),

                      const SizedBox(height: 20),

                      RegisterConfirmPasswordField(
                        controller:
                            controller
                                .confirmPasswordController,
                        validator:
                            controller
                                .validateConfirmPassword,
                        obscure:
                            controller
                                .obscureConfirmPassword
                                .value,
                        onToggle:
                            controller
                                .toggleConfirmPassword,
                      ),

                      const SizedBox(height: 50),

                      RegisterButton(
                        loading:
                            controller.isLoading.value,
                        onTap:
                            controller.register,
                      ),

                      const SizedBox(height: 24),

                      const RegisterLoginLink(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}