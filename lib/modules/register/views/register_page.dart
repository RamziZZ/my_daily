import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.75),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: controller.formKey,
                child: Obx(
                  () => Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.person_add_alt_1_rounded,
                            size: 80,
                            color: theme.colorScheme.primary,
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "Create Account",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Daftar untuk mulai mencatat aktivitas harianmu",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium,
                          ),

                          const SizedBox(height: 35),

                          TextFormField(
                            controller: controller.usernameController,
                            validator: controller.validateUsername,
                            decoration: const InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                          ),

                          const SizedBox(height: 18),

                          TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.validateEmail,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),

                          const SizedBox(height: 18),

                          TextFormField(
                            controller: controller.passwordController,
                            validator: controller.validatePassword,
                            obscureText: controller.obscurePassword.value,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                              suffixIcon: IconButton(
                                onPressed: controller.togglePassword,
                                icon: Icon(
                                  controller.obscurePassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          TextFormField(
                            controller:
                                controller.confirmPasswordController,
                            validator:
                                controller.validateConfirmPassword,
                            obscureText:
                                controller.obscureConfirmPassword.value,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              prefixIcon:
                                  const Icon(Icons.lock_reset_rounded),
                              suffixIcon: IconButton(
                                onPressed:
                                    controller.toggleConfirmPassword,
                                icon: Icon(
                                  controller.obscureConfirmPassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          SizedBox(
                            height: 55,
                            child: FilledButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.register,
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "REGISTER",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 25),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              const Text("Sudah punya akun?"),
                              TextButton(
                                onPressed: () {
                                  Get.offNamed(AppRoutes.login);
                                },
                                child: const Text("Login"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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