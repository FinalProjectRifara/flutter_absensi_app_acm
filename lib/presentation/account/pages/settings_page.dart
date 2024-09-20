import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/components/components.dart';
import '../../../core/assets/assets.gen.dart';
import '../widgets/list_profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Tema Aplikasi
            ListProfile(
              image: Assets.icons.themeAppSetting,
              title: 'Tema Aplikasi',
              subTitle: 'Atur tema aplikasi dengan mode malam.',
              onTap: () {
                // context.goNamed(
                //   RouteConstants.themeApp,
                //   pathParameters: PathParameters(
                //     rootTab: RootTab.account,
                //   ).toMap(),
                // );
              },
            ),

            const SpaceHeight(12),

            // Pilihan Bahasa
            ListProfile(
              image: Assets.icons.chooseLanguageSetting,
              title: 'Pilihan Bahasa',
              subTitle: 'pengaturan bahasa aplikasi.',
              onTap: () {
                // context.goNamed(
                //   RouteConstants.selectLanguage,
                //   pathParameters: PathParameters(
                //     rootTab: RootTab.account,
                //   ).toMap(),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
