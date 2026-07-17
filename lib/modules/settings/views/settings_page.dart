import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

import '../widgets/profile_card.dart';
import '../widgets/setting_tile.dart';
import '../widgets/section_title.dart';
import '../widgets/info_card.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            children: [

              /// PROFILE
              ProfileCard(
                username: controller.username.value,
              ),

              const SizedBox(height: 28),

              /// PREFERENCES
              const SectionTitle(
                title: "Preferences",
              ),

              const SizedBox(height: 12),

              SettingTile(
                icon: Icons.person_outline_rounded,
                title: "Edit Username",
                subtitle: controller.username.value,
                onTap: () {
                  final text = TextEditingController(
                    text: controller.username.value,
                  );

                  Get.defaultDialog(
                    title: "Edit Username",

                    content: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: text,
                        decoration: const InputDecoration(
                          hintText: "Enter username",
                        ),
                      ),
                    ),

                    textCancel: "Cancel",
                    textConfirm: "Save",

                    onConfirm: () async {
                      await controller.changeUsername(text.text);
                      Get.back();
                    },
                  );
                },
              ),

              const SizedBox(height: 12),

              SettingTile(
                icon: Icons.dark_mode_rounded,
                title: "Dark Mode",
                subtitle: "Enable dark appearance",

                trailing: Switch(
                  value: controller.isDarkMode.value,
                  onChanged: (value) async {
                    await controller.toggleDarkMode(value);
                  },
                ),
              ),

              const SizedBox(height: 12),

              SettingTile(
                icon: Icons.notifications_active_rounded,
                title: "Daily Reminder",
                subtitle: "Receive activity reminder",

                trailing: Switch(
                  value: controller.notification.value,
                  onChanged: (value) async {
                    await controller.toggleNotification(value);
                  },
                ),
              ),

              const SizedBox(height: 28),

              /// DATA
              const SectionTitle(
                title: "Data",
              ),

              const SizedBox(height: 12),

              SettingTile(
                icon: Icons.delete_forever_rounded,
                iconColor: Colors.red,
                title: "Hapus Semua Aktivitas",
                subtitle: "Remove all saved activities",

                onTap: () {
                  Get.defaultDialog(
                    title: "Hapus Semua",
                    middleText:
                        "Are you sure you want to delete all activities?",
                    textCancel: "Batal",
                    textConfirm: "Hapus",
                    confirmTextColor: Colors.white,

                    onConfirm: () async {
                      await controller.deleteAllData();
                    },
                  );
                },
              ),

              const SizedBox(height: 28),

              /// ABOUT
              const SectionTitle(
                title: "About",
              ),

              const SizedBox(height: 12),
              const InfoCard(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}