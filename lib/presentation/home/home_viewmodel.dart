import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/domain/services/events_service.dart';

import '../../domain/models/event.dart';
import '../../domain/models/upcoming_events.dart';
import '../../domain/providers.dart';

class HomeViewModel {
  EventsService eventsRepository = EventsService();
  List<Event> events = [];
  List<UpcomingEvents> upcomingEvents = [];

  init(WidgetRef ref) {
    getEvents(ref);
    getUpcomingEvents(ref);
    ref.refresh(showMoreUpcomingEventsProvider);
    ref.refresh(forYouProvider);
    ref.refresh(eventsLoadedProvider);
    ref.refresh(timeoutProvider);
    ref.refresh(timeoutProviderHelper);
  }

  getEvents(WidgetRef ref) => eventsRepository.getEvents().then((value) {
        events.addAll(value);
        ref.read(sharedEventsProvider.notifier).state = events;
        ref.read(forYouProvider.notifier).state = true;
      });

  getUpcomingEvents(WidgetRef ref) =>
      eventsRepository.getUpcomingEvents().then((value) {
        upcomingEvents.addAll(value);
        ref.read(showMoreUpcomingEventsProvider.notifier).state =
            upcomingEvents.map((e) => false).toList();
      });
}
