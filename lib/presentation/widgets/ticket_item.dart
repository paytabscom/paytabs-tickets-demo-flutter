import 'package:flutter/material.dart';

import '../../domain/models/event.dart';
import '../router/router_names.dart';
import '../styles/app_colors.dart';

class TicketItem extends StatelessWidget {
  final Event event;
  const TicketItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        splashColor: AppColors.red.withOpacity(0.2),
        highlightColor: Colors.red.withOpacity(0.1),
        onTap: () => Navigator.of(context).pushNamed(
          RouterNames.eventDetailsRoute,
          arguments: event,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: SizedBox(
                    height: 60,
                    child: Image(
                      image: NetworkImage(event.image),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          event.date,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        event.location[0],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
