import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ticket_app/domain/constants.dart';

import '../presentation/payment/payment_states.dart';
import '../presentation/styles/app_colors.dart';
import '../presentation/styles/app_theme.dart';
import 'models/event.dart';
import 'providers.dart';

extension CurrentTheme on WidgetRef {
  ThemeData get theme => watch(themeProvider);

  void toggleTheme() => read(themeProvider) == getApplicationLightTheme()
      ? read(themeProvider.notifier).state = getApplicationDarkTheme()
      : read(themeProvider.notifier).state = getApplicationLightTheme();
}

extension BottomNavigationBarIndex on WidgetRef {
  int get bottomBarIndex => watch(bottomBarIndexProvider);

  void setBottomBarIndex(int index) {
    read(bottomBarIndexProvider.notifier).state = index;
    if (index == 2) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }
}

extension SelectedFilter on WidgetRef {
  bool isSelected(int index) => watch(selectedFilterProvider) == index;

  void setSelectedFilter(int index) {
    if (index == read(selectedFilterProvider)) {
      read(selectedFilterProvider.notifier).state = -1;
    } else {
      read(selectedFilterProvider.notifier).state = index;
    }
  }
}

extension ShowMore on WidgetRef {
  bool get showMore => watch(eventDetailsShowMoreProvider);

  void toggleShowMore() => read(eventDetailsShowMoreProvider.notifier).state =
      !read(eventDetailsShowMoreProvider);
}

extension EventUpdates on WidgetRef {
  bool get updateNotification => watch(eventDetailsUpdateNotificationProvider);

  void toggleUpdateNotification() =>
      read(eventDetailsUpdateNotificationProvider.notifier).state =
          !read(eventDetailsUpdateNotificationProvider);

  bool get updatesReadMore => watch(eventDetailsUpdatesReadMoreProvider);

  void toggleUpdatesReadMore() =>
      read(eventDetailsUpdatesReadMoreProvider.notifier).state =
          !read(eventDetailsUpdatesReadMoreProvider);
}

extension SelectedEventsIndex on WidgetRef {
  bool get updateEventsNumber => watch(selectedEventsIndexProvider);

  void toggleEventsNumber() =>
      read(selectedEventsIndexProvider.notifier).state =
          !read(selectedEventsIndexProvider);
}

extension SelectedPlacesIndex on WidgetRef {
  bool get updatePlacesNumber => watch(selectedPlacesIndexProvider);

  void togglePlacesNumber() =>
      read(selectedPlacesIndexProvider.notifier).state =
          !read(selectedPlacesIndexProvider);
}

extension MyTicketsFilter on WidgetRef {
  bool isSelectedMyTickets(int index) =>
      watch(myTicketsFilterProvider) == index;

  void setSelectedMyTicketsFilter(int index) {
    if (index == read(myTicketsFilterProvider)) {
      read(myTicketsFilterProvider.notifier).state = -1;
    } else {
      read(myTicketsFilterProvider.notifier).state = index;
    }
  }
}

extension MoreUpcomingEvents on WidgetRef {
  List<bool> get showMoreUpcomingEvents =>
      watch(showMoreUpcomingEventsProvider);

  void toggleShowMoreUpcomingEvents(int index) {
    final List<bool> showMoreUpcomingEvents =
        List.from(read(showMoreUpcomingEventsProvider));
    showMoreUpcomingEvents[index] = !showMoreUpcomingEvents[index];
    read(showMoreUpcomingEventsProvider.notifier).state =
        showMoreUpcomingEvents;
  }
}

extension EventsLoaded on WidgetRef {
  ConnectionStates get eventsLoaded => watch(eventsLoadedProvider);

  void setEventsLoaded(ConnectionStates value) =>
      read(eventsLoadedProvider.notifier).state = value;

  bool get isEventsLoaded =>
      watch(eventsLoadedProvider) == ConnectionStates.connected;
  bool get isEventsLoading =>
      watch(eventsLoadedProvider) == ConnectionStates.loading;
  bool get isEventsError =>
      watch(eventsLoadedProvider) == ConnectionStates.error;
  bool get isEventsTimeout =>
      watch(eventsLoadedProvider) == ConnectionStates.timeout;
}

extension WillTextOverflow on String {
  bool willTextOverflow(TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }
}

extension SharedEvents on WidgetRef {
  List<Event> get sharedEvents => watch(sharedEventsProvider);

  void setSharedEvents(List<Event> events) =>
      read(sharedEventsProvider.notifier).state = events;

  String getMarkerIcon(Event event) {
    if (event.label == 'sports')
      return 'assets/images/sport_marker.png';
    else if (event.label == 'art')
      return 'assets/images/sport_marker.png';
    else
      return 'assets/images/music_marker.png';
  }
}

extension PaymentStatesExtension on WidgetRef {
  PaymentStates get paymentState => watch(paymentStateProvider);

  void setPaymentState(PaymentStates paymentStates) =>
      read(paymentStateProvider.notifier).state = paymentStates;

  bool get isPaymentStateLoading => paymentState is LoadingPaymentState;

  bool get isPaymentStateSuccess => paymentState is SuccessPaymentState;

  bool get isPaymentStateError => paymentState is ErrorPaymentState;
}

extension FilteredUpcomingEvents on WidgetRef {
  List<Event> getFilteredUpcomingEvents(List<Event> events) =>
      watch(filteredUpcomingEventsProvider(events));
}

extension Tickets on WidgetRef {
  List<Event> get tickets => watch(ticketsOwnedProvider);

  List<Event> get filteredTickets => watch(filteredTicketsOwnedProvider);

  void setTickets(List<Event> tickets) =>
      read(ticketsOwnedProvider.notifier).state = tickets;

  void addTicket(Event event) {
    final List<Event> tickets = List.from(read(ticketsOwnedProvider));
    tickets.add(event);
    read(ticketsOwnedProvider.notifier).state = tickets;
  }

  bool alreadyPurchased(Event event) => tickets.contains(event) ? true : false;
}
