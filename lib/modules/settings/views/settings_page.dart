import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/widgets/app_background.dart';
import '../controllers/settings_controller.dart';
import '../widgets/settings_profile_card.dart';
import '../widgets/settings_tile.dart';
import '../widgets/settings_theme_tile.dart';
import '../widgets/settings_logout_tile.dart';
import '../widgets/settings_about_card.dart';
import '../widgets/settings_section_title.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Obx(
            () => RefreshIndicator(
              onRefresh: controller.refreshData,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  // HEADER
                  Text(
                    "Settings",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 24),

                  // PROFILE
                  const SettingsProfileCard(),

                  const SizedBox(height: 32),

                  // ACCOUNT
                  const SettingsSectionTitle(
                    title: "Account",
                  ),

                  const SizedBox(height: 12),

                  SettingsTile(
                    icon: Icons.person_outline_rounded,
                    title: "Edit Username",
                    subtitle: controller.username.value,
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.editUsername,
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // PREFERENCES
                  const SettingsSectionTitle(
                    title: "Preferences",
                  ),

                  const SizedBox(height: 12),

                  SettingsThemeTile(
                    value: controller.isDarkMode.value,
                    onChanged: controller.toggleDarkMode,
                  ),

                  const SizedBox(height: 12),

                  SettingsTile(
                    icon: Icons.notifications_active_rounded,
                    title: "Pengingat Harian",
                    subtitle: "Aktifkan notifikasi aktivitas",
                    trailing: Switch(
                      value: controller.notification.value,
                      onChanged:
                          controller.toggleNotification,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // DATA
                  const SettingsSectionTitle(
                    title: "Data",
                  ),

                  const SizedBox(height: 12),

                  SettingsTile(
                    icon: Icons.delete_forever_rounded,
                    iconColor: Colors.red,
                    title: "Hapus Semua Aktivitas",
                    subtitle: "Menghapus seluruh data aktivitas",
                    onTap: () {
                      Get.defaultDialog(
                        title: "Hapus Data",
                        middleText:
                            "Semua aktivitas akan dihapus permanen.",
                        textCancel: "Batal",
                        textConfirm: "Hapus",
                        confirmTextColor: Colors.white,
                        onConfirm: () async {
                          await controller.deleteAllData();
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // ABOUT
                  const SettingsSectionTitle(
                    title: "About",
                  ),

                  const SizedBox(height: 12),

                  const SettingsAboutCard(),

                  const SizedBox(height: 32),

                  // LOGOUT
                  SettingsLogoutTile(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Logout",
                        middleText:
                            "Apakah Anda yakin ingin keluar?",
                        textCancel: "Batal",
                        textConfirm: "Logout",
                        confirmTextColor: Colors.white,
                        onConfirm: () async {
                          await controller.logout();
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}