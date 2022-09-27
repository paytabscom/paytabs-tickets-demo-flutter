import 'package:flutter/material.dart';

import '../../domain/models/event.dart';
import '../styles/app_colors.dart';

class SearchEvent extends StatelessWidget {
  const SearchEvent({
    required this.event,
    Key? key,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          height: MediaQuery.of(context).size.height * 0.12,
          margin: const EdgeInsets.all(12) - const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: NetworkImage(event.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    event.organizer.name,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      event.date,
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.6),
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(event.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black.withOpacity(0.8),
                  )),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.music_note,
                    color: AppColors.grey,
                  ),
                  Text(
                    event.genre,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.airplane_ticket,
                    color: AppColors.grey,
                  ),
                  Text(
                    generatePricesText(event.prices),
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String generatePricesText(List<int> prices) {
  String text = '';
  for (int price in prices) {
    text += price.toString();
    if (prices.indexOf(price) != prices.length - 1) {
      text += ' - ';
    }
  }
  return text;
}
