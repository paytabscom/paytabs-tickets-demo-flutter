import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_app/presentation/resources/asset_images.dart';

import '../../domain/models/organizer.dart';
import '../styles/app_colors.dart';

class OrganizerItem extends StatelessWidget {
  final Organizer organizer;
  const OrganizerItem({
    Key? key,
    required this.organizer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(organizer.image),
          radius: 25,
          backgroundColor: AppColors.white,
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              organizer.name,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  AssetImages.musicIcon,
                  color: AppColors.grey,
                  width: 10,
                ),
                const SizedBox(width: 4),
                Text(
                  organizer.genres.join(', '),
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
