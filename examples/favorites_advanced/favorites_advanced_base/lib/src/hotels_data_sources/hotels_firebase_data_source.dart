import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hotel.dart';
import '../models/hotel_search_filters.dart';
import 'hotels_data_source.dart';

class HotelsFirebaseDataSource implements HotelsDataSource {
  final firestore = FirebaseFirestore.instance;

  late CollectionReference hotelsReference;
  late CollectionReference hotelsExtraDetailsReference;

  factory HotelsFirebaseDataSource() {
    if (_instance == null) {
      _instance = HotelsFirebaseDataSource._();
    }

    return _instance!;
  }

  HotelsFirebaseDataSource._() {
    hotelsReference = firestore.collection('hotels');
    hotelsExtraDetailsReference = firestore.collection('hotelsExtraDetails');
  }

  static HotelsFirebaseDataSource? _instance;

  @override
  Future<Hotel> favoriteHotel(Hotel hotel, {required bool isFavorite}) async {
    await hotelsReference.doc(hotel.id).update({'isFavorite': isFavorite});

    return hotel.copyWith(isFavorite: isFavorite);
  }

  @override
  Future<List<Hotel>> fetchFullEntities(
    List<String> ids, {
    bool allProps = false,
  }) async {
    final querySnapshot = await hotelsReference.get();

    querySnapshot.docs.map((e) => print(e.data()));

    return [];
  }

  @override
  Future<List<Hotel>> getFavoriteHotels() async {
    final querySnapshot =
        await hotelsReference.where('isFavorite', isEqualTo: true).get();

    querySnapshot.docs.map((e) => print(e.data()));

    return [];
  }

  @override
  Future<List<Hotel>> getHotels({HotelSearchFilters? filters}) async {
    final querySnapshot = await hotelsReference.get();

    querySnapshot.docs.map((e) => print(e.data()));

    return [];
  }
}
