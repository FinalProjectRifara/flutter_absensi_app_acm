import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/components/buttons.dart';
import 'package:flutter_absensi_app_acm/core/core.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: BlocConsumer<LogoutBloc, LogoutState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: () {
                context.pushReplacement(const LoginPage());
              },
              error: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
                    content: Text(value),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  label: 'Logout',
                  onPressed: () {
                    debugPrint('Logout');
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
