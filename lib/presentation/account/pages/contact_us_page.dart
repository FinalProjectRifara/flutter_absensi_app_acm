import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/assets/assets.gen.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hubungi Kami',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deskripsi Keluhan
            const Text(
              'Untuk keluhan, kritik, dan saran dalam penggunaan aplikasi Absensi Arif Cipta Mandiri, Anda dapat menghubungi:',
              // style: fontQuicksand.copyWith(
              //   fontSize: fontMedium,
              // ),
            ),

            const SpaceHeight(8),

            // Card Number WhatsApp
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                launchWhatsApp();
              },
              child: Card(
                child: ListTile(
                  title: const Text(
                    '0895 4128 92094',
                    // style: fontQuicksand.copyWith(
                    //   fontSize: fontMedium,
                    // ),
                  ),
                  leading: Assets.icons.contactUsProfil.svg(),
                ),
              ),
            ),

            // Card Number Phone
            // InkWell(
            //   onTap: () {
            //     launchPhone();
            //   },
            //   child: Card(
            //     child: ListTile(
            //       title: const Text('0895 4128 92094'),
            //       leading: Assets.icons.contactUsProfil.svg(),
            //     ),
            //   ),
            // ),

            const SpaceHeight(4),

            // Card Email
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () async {
                launchEmail();
              },
              child: Card(
                child: ListTile(
                  title: const Text(
                    'rizkyfaisalrafi123@gmail.com',
                    // style: fontQuicksand.copyWith(
                    //   fontSize: fontMedium,
                    // ),
                  ),
                  leading: Assets.icons.emailIcon.svg(),
                ),
              ),
            ),

            const SpaceHeight(8),

            // Deskripsi Jam Kerja
            const Text(
              'Hubungi kami pada saat jam kerja:\n09:00 - 16:00 WIB',
              // style: fontQuicksand.copyWith(
              //   fontSize: fontMedium,
              // ),
            ),
          ],
        ),
      ),
    );
  }

  // Function launch WA
  void launchWhatsApp() async {
    String url = "wa.me/62895412892094";
    final Uri whatsappUrl = Uri(scheme: 'https', path: url);

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  // Function launch PhoneNumber
  void launchPhone() async {
    final Uri url = Uri(scheme: 'tel', path: "0895412892094");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function launch Email
  void launchEmail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'rizkyfaisalrafi123@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Send your Subject',
        'body': 'Your Description',
      }),
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
