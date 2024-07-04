import 'package:flutter/material.dart';
import 'package:flutter_absensi_app_acm/core/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListProfile extends StatelessWidget {
  final SvgGenImage image;
  final String title;
  final String subTitle;
  final Function()? onTap;

  const ListProfile({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Card(
        color: AppColors.white, // Menambahkan warna background pada Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Menambahkan border radius
        ),
        child: Row(
          children: [
            // Image/Icon Menu
            Container(
              padding: const EdgeInsets.all(4),
              child: image.svg(
                width: 56,
                height: 56,
              ),
            ),

            // Text and Subtitle
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 'Title
                    Text(
                      title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.black,
                        fontSize: 16,
                      ),
                      // style: fontQuicksand.copyWith(
                      //   overflow: TextOverflow.ellipsis,
                      //   fontWeight: medium,
                      //   color: AppColors.black,
                      //   fontSize: fontMedium,
                      // ),
                    ),

                    const SpaceHeight(4),

                    // Subtitle
                    Text(
                      subTitle,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      // style: fontQuicksand.copyWith(
                      //   overflow: TextOverflow.ellipsis,
                      //   fontWeight: reguler,
                      //   color: AppColors.grey,
                      //   fontSize: fontSmall,
                      // ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
