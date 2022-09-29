import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: Theme(
        data: ThemeData(
          splashColor: AppColors.red.withOpacity(0.2),
          highlightColor: Colors.red.withOpacity(0.1),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 32,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/tickets.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language, color: AppColors.red),
              title: Text('Change Language',
                  style: Theme.of(context).textTheme.titleSmall),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.grey),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.call, color: AppColors.red),
              title: Text(
                'Contact Us',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.grey,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.share, color: AppColors.red),
              title: Text('Invite Your Friends',
                  style: Theme.of(context).textTheme.titleSmall),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.grey),
              onTap: () {
                Share.share('https://github.com/Hero2323/FreebieTicket');
              },
            ),
          ],
        ),
      ),
    );
  }
}
