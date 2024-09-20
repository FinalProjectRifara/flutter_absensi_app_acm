// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_online_shop_app/core/components/components.dart';
// import 'package:flutter_online_shop_app/core/constants/theme.dart';
// import 'package:flutter_online_shop_app/presentation/account/bloc/theme/theme_bloc.dart';

// class ThemeAppPage extends StatefulWidget {
//   const ThemeAppPage({super.key});

//   @override
//   State<ThemeAppPage> createState() => _ThemeAppPageState();
// }

// class _ThemeAppPageState extends State<ThemeAppPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tema Aplikasi'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SpaceHeight(16),
//           BlocBuilder<ThemeBloc, ThemeState>(
//             builder: (context, state) {
//               final theme = state.maybeWhen(
//                 themeData: (theme) => theme,
//                 orElse: () => ThemeData.light(),
//               );

//               return ListTile(
//                 leading: const Icon(Icons.dark_mode),
//                 title: Text(
//                   'Dark Theme',
//                   style: fontQuicksand.copyWith(
//                     fontWeight: semiBold,
//                     fontSize: fontMedium,
//                   ),
//                 ),
//                 trailing: Switch(
//                   value: theme.brightness == Brightness.dark,
//                   onChanged: (value) {
//                     context
//                         .read<ThemeBloc>()
//                         .add(const ThemeEvent.toggleTheme());
//                   },
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
