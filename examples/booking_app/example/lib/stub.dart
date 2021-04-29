import 'package:favorites_advanced_base/models.dart';

final hotel = Hotel(
  id: '1',
  title: 'Premier Inn Dubai International Airport',
  subTitle: '4 Stars',
  dist: 120,
  imagePath: 'assets/hotel_0.png',
  perNight: 100,
  rating: 4.3,
  reviews: 34,
  isFavorite: false,
  description: 'Hyatt Place Dubai Jumeirah Residences',
  features: const [
    'Free WiFi',
    'Beachfront',
    'Free parking',
    'Family rooms',
    'Bar',
  ],
  roomCapacity: 2,
  personCapacity: 4,
  startWorkDate: _getDateForMonthAndDay(1, 1),
  endWorkDate: _getDateForMonthAndDay(2, 1),
);

DateTime _getDateForMonthAndDay(int month, int day,
        [bool isNextYear = false]) =>
    DateTime(DateTime.now().year + (isNextYear ? 1 : 0), month, day);
