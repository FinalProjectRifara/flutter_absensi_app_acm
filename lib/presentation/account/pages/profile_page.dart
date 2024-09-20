import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/presentation/account/pages/edit_profile_page.dart';
import 'package:flutter_absensi_app_acm/presentation/account/widgets/list_tile_profile.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core.dart';
import '../../auth/bloc/logout/logout_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Photo Profile
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(Assets.images.logoAcm2.path),
              ),
              const SpaceHeight(40),
            ],
          ),

          // Name
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Nama',
                    subtitle: user.name ?? 'Harap login terlebih dahulu',
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

          const SpaceHeight(20),

          // Email
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Email',
                    subtitle: user.email ?? 'Harap login terlebih dahulu',
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

          const SpaceHeight(20),

          // No Hp
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Nomor Handphone',
                    subtitle: user.phone ?? 'Harap login terlebih dahulu',
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
                  child: Text('Error: ' + message),
                ),
              );
            },
          ),

          const SpaceHeight(20),

          // Position
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Position',
                    subtitle: user.position ?? 'Harap login terlebih dahulu',
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

          const SpaceHeight(20),

          // Role
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Role',
                    subtitle: user.role ?? 'Harap login terlebih dahulu',
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

          const SpaceHeight(20),

          // Cuti
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Cuti',
                    subtitle:
                        user.cuti.toString() ?? 'Harap login terlebih dahulu',
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

          const SpaceHeight(20),

          // Department
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) {
                  return ListTileProfile(
                    title: 'Department',
                    subtitle: user.department ?? 'Harap login terlebih dahulu',
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

          const SpaceHeight(40),

          // Button Ubah Data
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {
                  return const Column(
                    children: [
                      Text(
                        'Terjadi Error',
                        // style: fontQuicksand.copyWith(
                        //   color: AppColors.black,
                        //   fontWeight: bold,
                        //   fontSize: fontSmall,
                        // ),
                      ),
                    ],
                  );
                },
                success: () {
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
                        // style: fontQuicksand.copyWith(
                        //   fontWeight: bold,
                        //   fontSize: fontSmall,
                        // ),
                      ),
                    ),
                  );
                },
                error: (message) {
                  // context.goNamed(
                  //   RouteConstants.login,
                  // );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.red,
                      content: Text(
                        'Anda belum Login, Harap Login terlebih dahulu!',
                        // style: fontQuicksand.copyWith(
                        //   fontWeight: bold,
                        //   fontSize: fontSmall,
                        // ),
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
                    dialogType: DialogType.info,
                    animType: AnimType.topSlide,
                    showCloseIcon: true,
                    alignment: Alignment.centerLeft,
                    title: 'Ubah data profil ?',
                    // titleTextStyle: fontQuicksand.copyWith(
                    // color: AppColors.black,
                    //   fontWeight: semiBold,
                    //   fontSize: fontMedium,
                    // ),
                    desc:
                        'Jika Anda yakin ingin mengubah data silahkan tekan Ubah.',

                    // descTextStyle: fontQuicksand.copyWith(
                    //   fontWeight: semiBold,
                    //   fontSize: fontMedium,
                    // ),

                    // Action to perform on cancel and ok buttons
                    btnCancel: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        backgroundColor: AppColors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Batal',
                        style: TextStyle(color: AppColors.black),
                        // style: fontQuicksand.copyWith(
                        //   color: AppColors.black,
                        //   fontWeight: bold,
                        //   fontSize: fontSmall,
                        // ),
                      ),
                    ),
                    btnOk: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        // Go to Edit Profile Page
                        context.push(
                          const EditProfilePage(),
                        );

                        // Tutup Dialog
                        // Navigator.pop(context);
                      },
                      child: const Text(
                        'Ubah',
                        // style: fontQuicksand.copyWith(
                        //   color: AppColors.white,
                        //   fontWeight: bold,
                        //   fontSize: fontSmall,
                        // ),
                      ),
                    ),
                  ).show();
                },
                text: 'Ubah data profil',
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              );
            },
          ),
        ],
      ),
    );
  }
}
