import 'package:flutter/material.dart';

import '../../domain/models/place.dart';
import '../styles/app_colors.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({
    required this.place,
    Key? key,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          margin: const EdgeInsets.all(12) - const EdgeInsets.only(left: 12),
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(place.image),
            backgroundColor: AppColors.white,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                place.organizer,
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(place.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black.withOpacity(0.8),
                    )),
              ),
              Row(
                children: [
                  const Icon(Icons.music_note, color: AppColors.grey),
                  Text(
                    place.genre,
                    style: const TextStyle(color: AppColors.grey, fontSize: 12),
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
