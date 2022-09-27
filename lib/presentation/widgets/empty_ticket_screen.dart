import 'package:flutter/material.dart';

import '../resources/asset_images.dart';
import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class EmptyTicketScreen extends StatelessWidget {
  const EmptyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.noTickets),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Popular',
                    style: lightTicketsTitle,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: popular.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.grey.withOpacity(0.5),
                          ),
                          height: 32,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {},
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    popular[index],
                                    style: lightTicketsPopular,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 16);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Tickets Bought',
                      style: lightTicketsMidTitle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'It appears you haven\'t bought any tickets yet. Maybe try searching these?',
                      textAlign: TextAlign.center,
                      style: lightTicketsSubtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<String> popular = [
  'Phil Collins',
  'TV on the Radio',
  'FC Barcelona',
];
// * 