import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/constants/colors.dart';
import 'package:flutter_absensi_app_acm/data/datasources/attendance_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/datasources/cuti_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/datasources/firebase_messanging_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/datasources/permisson_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/data/datasources/user_remote_datasource.dart';
import 'package:flutter_absensi_app_acm/firebase_options.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/bloc/user/user_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/auth/pages/splash_page.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/add_cuti/add_cuti_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/add_permissions/add_permissions_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/check_in/check_in_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/check_out/check_out_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/get_attendance_by_date/get_attendance_by_date_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/get_company/get_company_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/is_checked_in/is_checked_in_bloc.dart';
import 'package:flutter_absensi_app_acm/presentation/home/bloc/update_user_register_face/update_user_register_face_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessangingRemoteDatasource().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              UpdateUserRegisterFaceBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCompanyBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => IsCheckedInBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckInBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckOutBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddPermissionsBloc(PermissonRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddCutiBloc(CutiRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetAttendanceByDateBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UserBloc(UserRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Absensi App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          dividerTheme:
              DividerThemeData(color: AppColors.light.withOpacity(0.5)),
          dialogTheme: const DialogTheme(elevation: 0),
          textTheme: GoogleFonts.kumbhSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.kumbhSans(
              color: AppColors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
