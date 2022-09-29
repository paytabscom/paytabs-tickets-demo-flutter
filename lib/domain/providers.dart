import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/constants.dart';

import '../presentation/styles/app_theme.dart';
import 'models/event.dart';
import 'package:ticket_app/presentation/payment/payment_states.dart';

final themeProvider = StateProvider((ref) => getApplicationLightTheme());

final bottomBarIndexProvider = StateProvider((ref) => 0);

final selectedFilterProvider = StateProvider((ref) => -1);

final eventDetailsShowMoreProvider = StateProvider((ref) => false);

final eventDetailsUpdateNotificationProvider =
    StateProvider.autoDispose((ref) => false);

final eventDetailsUpdatesReadMoreProvider =
    StateProvider.autoDispose((ref) => false);
final selectedEventsIndexProvider = StateProvider((ref) => false);

final selectedPlacesIndexProvider = StateProvider((ref) => false);

final myTicketsFilterProvider = StateProvider((ref) => -1);

final showMoreUpcomingEventsProvider = StateProvider<List<bool>>((ref) => []);

final forYouProvider = StateProvider((ref) => false);

final eventsLoadedProvider = StateProvider<ConnectionStates>((ref) {
  if (!ref.watch(timeoutProvider)) {
    if ((ref.watch(showMoreUpcomingEventsProvider).isNotEmpty &&
        ref.watch(forYouProvider))) {
      return ConnectionStates.connected;
    } else {
      return ConnectionStates.loading;
    }
  } else {
    return ConnectionStates.timeout;
  }
});

final timeoutProvider = StateProvider<bool>((ref) => false);

final timeoutProviderHelper = Provider<void>(
  (ref) => Future.delayed(Duration(seconds: 5)).then(
    (value) {
      if (ref.read(eventsLoadedProvider) == ConnectionStates.loading) {
        ref.read(timeoutProvider.notifier).state = true;
      }
    },
  ),
);

final sharedEventsProvider = StateProvider<List<Event>>((ref) => []);

final paymentStateProvider =
    StateProvider<PaymentStates>((ref) => InitialPaymentState());

final filteredUpcomingEventsProvider =
    StateProvider.family<List<Event>, List<Event>>((ref, events) {
  final selectedFilter = ref.watch(selectedFilterProvider);
  if (selectedFilter == -1) {
    return events;
  } else if (selectedFilter == 0) {
    return events.where((event) => event.label == 'art').toList();
  } else if (selectedFilter == 1) {
    return events.where((event) => event.label == 'music').toList();
  } else {
    return events.where((event) => event.label == 'sport').toList();
  }
});

final ticketsOwnedProvider = StateProvider<List<Event>>((ref) => []);

final filteredTicketsOwnedProvider = StateProvider<List<Event>>((ref) {
  switch (ref.watch(myTicketsFilterProvider)) {
    case -1:
      return ref.watch(ticketsOwnedProvider);
    case 0:
      return ref
          .watch(ticketsOwnedProvider)
          .where((element) => element.label == 'art')
          .toList();
    case 1:
      return ref
          .watch(ticketsOwnedProvider)
          .where((element) => element.label == 'music')
          .toList();
    default:
      return ref
          .watch(ticketsOwnedProvider)
          .where((element) => element.label == 'sport')
          .toList();
  }
});
