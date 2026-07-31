import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../controllers/edit_username_controller.dart';

class EditUsernamePage extends GetView<EditUsernameController> {
  const EditUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------------------------
                // HEADER
                //----------------------------------

                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Edit Username",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .primary,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Perbarui nama pengguna akunmu",
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color,
                  ),
                ),

                const SizedBox(height: 30),

                //----------------------------------
                // PROFILE PREVIEW
                //----------------------------------

                Center(
                  child: Obx(
                    () => CircleAvatar(
                      radius: 45,
                      backgroundColor:
                          const Color(0xff6C63FF),
                      child: Text(
                        controller.settingsController
                            .username
                            .value
                            .substring(0, 1)
                            .toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: Obx(
                    () => Text(
                      controller
                          .settingsController
                          .username
                          .value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                //----------------------------------
                // TEXTFIELD
                //----------------------------------

                const Text(
                  "Username Baru",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller:
                      controller.usernameController,
                  decoration: InputDecoration(
                    hintText:
                        "Masukkan username baru",
                    filled: true,
                    fillColor:
                        Theme.of(context).cardColor,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                      borderSide: BorderSide.none,
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
                    onPressed:
                        controller.saveUsername,
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
                      "Simpan Perubahan",
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