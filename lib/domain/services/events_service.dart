import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import '../models/event.dart';
import '../models/upcoming_events.dart';
import '../network/end_points.dart';
import '../network/responses/events_response.dart';
import '../network/responses/upcoming_events_response.dart';
import '../remote/dio_helper.dart';

class EventsService {
  Future<List<Event>> getEvents() async {
    try {
      Response response = await DioHelper.getData(url: epGetEvents, query: {});

      if (response.statusCode == 200) {
        EventsResponse eventsResponse = EventsResponse.fromJson(response.data);
        return eventsResponse.events;
      }
    } catch (exception) {
      debugPrint("Catch exception1: $exception");
    }
    return <Event>[];
  }

  Future<List<UpcomingEvents>> getUpcomingEvents() async {
    try {
      Response response =
          await DioHelper.getData(url: epGetUpcomingEvents, query: {});

      if (response.statusCode == 200) {
        UpcomingEventsResponse eventsResponse =
            UpcomingEventsResponse.fromJson(json.decode(response.data));
        return eventsResponse.upcomingevents;
      }
    } catch (exception) {
      debugPrint("Catch exception2: $exception");
    }
    return <UpcomingEvents>[];
  }
}
