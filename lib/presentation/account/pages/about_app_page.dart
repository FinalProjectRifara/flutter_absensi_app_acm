import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/assets/assets.dart';
import 'package:flutter_absensi_app_acm/core/components/components.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image Logo
                  Image.asset(
                    Assets.images.logoacm.path,
                    width: double.infinity,
                    // height: 400,
                  ),

                  const SpaceHeight(8),

                  // Name App
                  // const Text(
                  //   'PT. Arif Cipta Mandiri',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //   ),
                  //   // style: fontQuicksand.copyWith(
                  //   //   color: AppColors.black,
                  //   //   fontWeight: bold,
                  //   //   fontSize: fontExtra,
                  //   // ),
                  // ),

                  const SpaceHeight(22),
                ],
              ),
            ),

            // Description App
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Versi App
                  Text(
                    'Aplikasi versi 1.0 - PT. Arif Cipta Mandiri',
                    // style: fontQuicksand.copyWith(
                    //   fontWeight: bold,
                    //   fontSize: fontMedium,
                    // ),
                  ),

                  SpaceHeight(12),

                  // Description App
                  Text(
                    'Arif Cipta Mandiri merupakan Perusahaan dibidang restoran A Fung Baso Sapi Asli yang memiliki banyak outlet di Indonesia. Aplikasi ini merupakan versi 1.0 yang dimana fitur didalam sistem ini masih tahap pengembangan untuk perbaikan kedepannya demi membantu pegawai dalam melakukan absensi, cuti dan lain sebagainya.',
                    // style: fontQuicksand.copyWith(
                    //   fontWeight: reguler,
                    //   fontSize: fontMedium,
                    //   letterSpacing: 0.5,
                    // ),
                  ),

                  SpaceHeight(20),

                  // Information Prroblem
                  Text(
                    'Apabila menemukan kendala dalam melakukan transaksi. Silahkan menuju ke menu Hubungi Kami.',
                    // style: fontQuicksand.copyWith(
                    //   fontWeight: bold,
                    //   fontSize: fontMedium,
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
