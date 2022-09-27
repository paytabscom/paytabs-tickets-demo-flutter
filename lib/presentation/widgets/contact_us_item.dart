import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../resources/asset_images.dart';
import '../styles/app_colors.dart';
import '../../domain/models/developer.dart';

class ContactUsItem extends StatelessWidget {
  final Developer developer;

  const ContactUsItem({
    super.key,
    required this.developer,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      shadowColor: AppColors.white,
      color: AppColors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Image(
                  image: AssetImage(developer.image),
                ),
              )),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(developer.image), fit: BoxFit.contain),
                ),
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    developer.name,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    developer.title,
                    style: TextStyle(
                      color: AppColors.grey,
                      letterSpacing: 1.25,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Material(
                  color: AppColors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            AssetImages.gmail,
                            height: 20,
                          ),
                        ),
                        onTap: () => launchUrlString(
                            'mailto:${developer.email}?',
                            mode: LaunchMode.externalApplication),
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            AssetImages.whatsapp,
                            height: 28,
                            color: Colors.green,
                          ),
                        ),
                        onTap: () => launchUrlString(
                          'https://wa.me/${developer.phone}',
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: AppColors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            AssetImages.linkedin,
                            height: 30,
                            color: AppColors.blue,
                          ),
                        ),
                        onTap: () => launchUrlString(
                          developer.linkedin,
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            AssetImages.github,
                            height: 30,
                          ),
                        ),
                        onTap: () => launchUrlString(
                          developer.github,
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
