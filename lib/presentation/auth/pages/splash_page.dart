import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/core.dart';
import 'package:flutter_absensi_app_acm/data/datasources/auth_local_datasource.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/pages/login_page.dart';
import 'package:flutter_absensi_app_acm/presentation/home/pages/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(const LoginPage()),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder(
        future: AuthLocalDatasource().isAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Assets.images.logo.image(),
                  ),
                  const Spacer(),
                  Assets.images.logoCodeWithBahri.image(height: 70),
                  const SpaceHeight(20.0),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data! == true) {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const MainPage()),
              );
            } else {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const LoginPage()),
              );
            }
          }
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Assets.images.logoAcm2.image(),
              ),
              const Spacer(),
              // Assets.images.logoCodeWithBahri.image(height: 70),
              const SpaceHeight(20.0),
            ],
          );
        },
      ),
    );
  }
}
