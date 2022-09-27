import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/domain/providers.dart';
import 'package:ticket_app/presentation/home/home_viewmodel.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';
import 'package:ticket_app/presentation/widgets/for_you_item.dart';
import 'package:ticket_app/presentation/widgets/upcoming_events_item.dart';
import '../resources/asset_images.dart';
import '../widgets/collection_item.dart';
import '../widgets/filter_item.dart';
import 'home_mock.dart';

// Future<List<UpcomingEvents>> getUpcomingEvents() async {
//   await Future.delayed(const Duration(seconds: 1));
//   return upcomingEvents;
// }

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _homeViewModel.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(timeoutProviderHelper);
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overflow) {
        overflow.disallowIndicator();
        return false;
      },
      child: ref.isEventsLoaded
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'For you',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AssetImages.filterIcon,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 280,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ForYouItem(event: _homeViewModel.events[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemCount: _homeViewModel.events.length,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Collections',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 160,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: _homeViewModel.events.length,
                        itemBuilder: (context, index) => SizedBox(
                          child: CollectionItem(
                            collection: _homeViewModel.events[index],
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Upcoming',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
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
                              selected: ref.isSelected(index),
                              onTap: () => ref.setSelectedFilter(index),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: filters.length,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  StaggeredGrid.count(
                    crossAxisCount: MediaQuery.of(context).size.width ~/ 340,
                    axisDirection: AxisDirection.down,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: List.generate(
                      _homeViewModel.upcomingEvents.length,
                      (index) {
                        final filteredEvents = ref.getFilteredUpcomingEvents(
                            _homeViewModel.upcomingEvents[index].events);
                        return filteredEvents.length > 0
                            ? UpcomingEventsItem(
                                index: index,
                                upcomingEvents: _homeViewModel
                                    .upcomingEvents[index]
                                    .copyWith(
                                  events: filteredEvents,
                                  noOfEvents: filteredEvents.length,
                                ),
                              )
                            : SizedBox();
                      },
                    ),
                  )
                ],
              ),
            )
          : ref.isEventsLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.red),
                )
              : Center(
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.signal_wifi_connected_no_internet_4_sharp,
                          size: 200, color: AppColors.grey.withOpacity(0.5)),
                      const SizedBox(height: 16),
                      Text(
                        'No Internet, please try again later',
                        style: TextStyle(
                          color: AppColors.grey.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          _homeViewModel.init(ref);
                        },
                        child: Text(
                          'Retry',
                          style: TextStyle(
                            color: AppColors.red,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
    );
  }
}
