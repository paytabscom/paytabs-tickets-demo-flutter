import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/presentation/widgets/empty_ticket_screen.dart';
import 'package:ticket_app/presentation/widgets/ticket_item.dart';
import '../../domain/models/filter.dart';
import '../resources/asset_images.dart';
import '../styles/app_colors.dart';
import '../widgets/filter_item.dart';

class TicketsScreen extends ConsumerWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.tickets.isNotEmpty
        ? SafeArea(
            child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Tickets',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer(
                    builder: (context, ref, child) => SizedBox(
                      height: 60,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: FilterItem(
                              filter: filters[index],
                              selected: ref.isSelectedMyTickets(index),
                              onTap: () =>
                                  ref.setSelectedMyTicketsFilter(index),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: filters.length,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ref.filteredTickets.length,
                    itemBuilder: (context, index) {
                      return TicketItem(
                        event: ref.filteredTickets[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
          ))
        : EmptyTicketScreen();
  }
}

List<Filter> filters = [
  Filter(
    id: 1,
    color: AppColors.red,
    image: AssetImages.artIcon,
    name: 'Art'.toUpperCase(),
  ),
  Filter(
    id: 2,
    color: AppColors.blue,
    image: AssetImages.musicIcon,
    name: 'Music'.toUpperCase(),
  ),
  Filter(
    id: 3,
    color: AppColors.orange,
    image: AssetImages.sportsIcon,
    name: 'Sports'.toUpperCase(),
  ),
];

// TODO: make sure that the build.yaml works
// TODO: Added attributions for the design and icons/images