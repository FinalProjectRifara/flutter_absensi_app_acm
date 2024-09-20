import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/presentation/account/pages/about_app_page.dart';
import 'package:flutter_absensi_app_acm/presentation/account/pages/contact_us_page.dart';
import 'package:flutter_absensi_app_acm/presentation/account/pages/profile_page.dart';
import 'package:flutter_absensi_app_acm/presentation/account/pages/settings_page.dart';
import 'package:flutter_absensi_app_acm/presentation/account/widgets/list_profile.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/user/user_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_online_shop_app/core/components/components.dart';
// import 'package:flutter_online_shop_app/core/constants/theme.dart';
// import 'package:flutter_online_shop_app/presentation/account/user_bloc/bloc/user_bloc.dart';
// import 'package:flutter_online_shop_app/presentation/account/widgets/list_profile.dart';
// import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
// import '../../../core/router/app_router.dart';
// import '../../auth/logout_bloc/bloc/logout_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            children: [
              // Photo Profile
              ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    Assets.images.logoAcm2.path,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  )),

              const SpaceHeight(12),

              // Get Name
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (user) {
                      return Column(
                        children: [
                          // Name
                          Text(
                            user.name ?? 'Harap login terlebih dahulu',
                          ),

                          // Number Phone
                          Text(
                            user.phone ?? 'Harap login terlebih dahulu',
                          ),
                        ],
                      );
                    },
                    orElse: () {
                      return const Column(
                        children: [
                          Text('Terjadi Error'),
                        ],
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (message) => Center(
                      child: Text(message),
                    ),
                  );
                },
              ),
            ],
          ),

          const SpaceHeight(12),

          // Profil
          ListProfile(
            image: Assets.icons.profileProfil,
            title: 'Profil',
            subTitle: 'Atur dan lihat data Anda.',
            onTap: () {
              context.push(const ProfilePage());
              // context.goNamed(
              //   RouteConstants.profile,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.account,
              //   ).toMap(),
              // );
            },
          ),

          const SpaceHeight(4),

          const SpaceHeight(4),

          // Hubungi Kami
          ListProfile(
            image: Assets.icons.contactUsProfil,
            title: 'Hubungi Kami',
            subTitle: 'Sampaikan kendala, kritik, dan saran Anda.',
            onTap: () {
              context.push(const ContactUsPage());
              // context.goNamed(
              //   RouteConstants.contactUs,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.account,
              //   ).toMap(),
              // );
            },
          ),

          const SpaceHeight(4),

          // Tentang Aplikasi
          ListProfile(
            image: Assets.icons.aboutAppProfil,
            title: 'Tentang Aplikasi',
            subTitle: 'Lihat informasi lengkap tentang aplikasi.',
            onTap: () {
              context.push(const AboutAppPage());
              // context.goNamed(
              //   RouteConstants.aboutApp,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.account,
              //   ).toMap(),
              // );
            },
          ),

          const SpaceHeight(4),

          // Pengaturan
          ListProfile(
            image: Assets.icons.settingsProfil,
            title: 'Pengaturan',
            subTitle: 'Pengaturan tentang aplikasi.',
            onTap: () {
              context.push(const SettingsPage());
              // context.goNamed(
              //   RouteConstants.settings,
              //   pathParameters: PathParameters(
              //     rootTab: RootTab.account,
              //   ).toMap(),
              // );
            },
          ),

          const SpaceHeight(40),

          // Awesome Dialog
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {
                  return const Column(
                    children: [
                      Text(
                        'Terjadi Error',
                      ),
                    ],
                  );
                },
                success: () {
                  context.pushReplacement(const LoginPage());
                  // context.goNamed(
                  //   RouteConstants.root,
                  //   pathParameters: PathParameters().toMap(),
                  // );

                  // context.goNamed(
                  //   RouteConstants.login,
                  // );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.red,
                      content: Text(
                        'Berhasil Keluar Akun',
                      ),
                    ),
                  );
                },
                error: (message) {
                  // context.goNamed(
                  //   RouteConstants.login,
                  // );
                  context.pushReplacement(const LoginPage());

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.red,
                      content: Text(
                        'Anda belum Login, Harap Login terlebih dahulu!',
                      ),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return AnimatedButton(
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.topSlide,
                    showCloseIcon: true,
                    alignment: Alignment.centerLeft,
                    title: 'Keluar Akun Arif Cipta Mandiri?',

                    desc:
                        'Jika kamu ingin menggunakan layanan Absensi kembali, kamu perlu masuk ke akunmu lagi.',

                    // Action to perform on cancel and ok buttons
                    btnCancel: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: AppColors.red,
                          width: 2,
                        ),
                        backgroundColor: AppColors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Batal',
                      ),
                    ),
                    btnOk: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: AppColors.red,
                          width: 2,
                        ),
                        backgroundColor: AppColors.red,
                      ),
                      onPressed: () async {
                        // Keluar Akun

                        context
                            .read<LogoutBloc>()
                            .add(const LogoutEvent.logout());

                        context.pushReplacement(const LoginPage());
                      },
                      child: const Text(
                        'Keluar',
                      ),
                    ),
                  ).show();
                },
                text: 'Keluar Akun',
                color: AppColors.red,
                borderRadius: BorderRadius.circular(10),
              );
            },
          ),
        ],
      ),
    );
  }
}
