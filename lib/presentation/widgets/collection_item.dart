import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/router/router_names.dart';
import 'package:ticket_app/presentation/styles/app_styles.dart';
import '../../domain/models/event.dart';

import '../resources/asset_images.dart';

class CollectionItem extends StatelessWidget {
  final Event collection;
  const CollectionItem({
    Key? key,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8 > 320
          ? 320
          : MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(collection.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Navigator.of(context).pushNamed(
              RouterNames.eventDetailsRoute,
              arguments: collection,
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.title,
                  style: lightCollectionTitle,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Image(image: AssetImage(AssetImages.genre)),
                    const SizedBox(width: 5),
                    Text(
                      collection.genre,
                      style: lightCollectionGenre,
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Learn More',
                            style: lightCollectionLearnMore,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
