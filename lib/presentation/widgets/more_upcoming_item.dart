import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/ext.dart';
import '../../domain/models/event.dart';
import '../styles/app_styles.dart';

class MoreUpcomingItem extends StatelessWidget {
  final int upcomingId;
  final String image;
  final List<Event> events;
  const MoreUpcomingItem({
    Key? key,
    required this.upcomingId,
    required this.image,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Consumer(
        builder: (context, ref, child) => Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => ref.toggleShowMoreUpcomingEvents(upcomingId),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ref.showMoreUpcomingEvents[upcomingId]
                            ? 'Show Less'.toUpperCase()
                            : '${events.length} more events'.toUpperCase(),
                        style: lightCollectionTitle,
                      ),
                      Icon(
                        ref.showMoreUpcomingEvents[upcomingId]
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down_sharp,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
