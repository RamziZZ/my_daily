import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../controllers/username_success_controller.dart';

import '../../../app/routes/app_routes.dart';

class UsernameSuccessPage
    extends GetView<
        UsernameSuccessController> {
  const UsernameSuccessPage({
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

                //----------------------------------
                // ICON
                //----------------------------------

                Container(
                  width: 130,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xff6C63FF,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 70,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                //----------------------------------
                // TITLE
                //----------------------------------

                Text(
                  "Berhasil!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight:
                        FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .primary,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Username berhasil diperbarui",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                Obx(
                  () => Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .cardColor,
                      borderRadius:
                          BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: Text(
                      controller.username.value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(0xff6C63FF),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                //----------------------------------
                // BUTTON
                //----------------------------------

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(
                        AppRoutes.main,
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(
                        0xff6C63FF,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Selesai",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}