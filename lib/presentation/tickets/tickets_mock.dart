import 'package:ticket_app/domain/models/event_latlng.dart';

import '../../domain/models/event.dart';
import '../../domain/models/organizer.dart';
import '../../domain/models/update.dart';
import '../resources/asset_images.dart';

List<Event> events = [
  Event(
    id: 11,
    title: 'Electronica Next Month',
    details: 'Free directories: directories are perfect for customers that '
        'are searching for a particular topic. What\'s great about them is '
        'that you only have to post once and they are good for long periods '
        'of time. It saves a lot of your time when you don\'t have to '
        'resubmit your information every week',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: Organizer(
      name: 'Club Kiss',
      genres: ['Concerts', 'Parties'],
      image: AssetImages.organizerIcon,
    ),
    discountPrices: [30, 80],
    updates: [
      Update(
        id: 1,
        date: '2019, 8, 21',
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
      Update(
        id: 1,
        date: '2019, 8, 24',
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
      Update(
        id: 1,
        date: '2019, 8, 24',
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
    ],
    eventLatLng: EventLatLng(lat: 52.2296756, lng: 21.0122287),
    label: 'music',
  ),
  Event(
    id: 12,
    title: 'Electronica Next Month',
    details: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: Organizer(
      name: 'Club Kiss',
      genres: ['Concerts', 'Parties'],
      image: AssetImages.organizerIcon,
    ),
    discountPrices: [30, 80],
    updates: [],
    eventLatLng: EventLatLng(lat: 52.2296756, lng: 21.0122287),
    label: 'music',
  ),
  Event(
    id: 13,
    title: 'Electronica Next Month',
    details: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: Organizer(
      name: 'Club Kiss',
      genres: ['Concerts', 'Parties'],
      image: AssetImages.organizerIcon,
    ),
    discountPrices: [30, 80],
    updates: [
      Update(
        id: 1,
        date: '2019, 8, 21',
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
    ],
    eventLatLng: EventLatLng(lat: 52.2296756, lng: 21.0122287),
    label: 'music',
  ),
];
