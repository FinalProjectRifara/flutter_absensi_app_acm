// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/constants/colors.dart';

class ListTileProfile extends StatelessWidget {
  String title;
  String subtitle;
  ListTileProfile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: AppColors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            // style: fontQuicksand.copyWith(
            //   fontSize: fontMedium,
            //   fontWeight: semiBold,
            // ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14.0),
            // style: fontQuicksand.copyWith(
            //   fontSize: fontSmall,
            //   fontWeight: medium,
            // ),
          ),
        ],
      ),
    );
  }
}
