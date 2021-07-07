// Mocks generated by Mockito 5.0.8 from annotations
// in booking_app/test/feature_hotel/search/blocs/hotel_list_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:booking_app/base/common_blocs/coordinator_bloc.dart' as _i5;
import 'package:booking_app/base/repositories/paginated_hotels_repository.dart'
    as _i6;
import 'package:favorites_advanced_base/src/models/hotel.dart' as _i3;
import 'package:favorites_advanced_base/src/models/hotel_extra_details.dart'
    as _i9;
import 'package:favorites_advanced_base/src/models/hotel_full_extra_details.dart'
    as _i4;
import 'package:favorites_advanced_base/src/models/hotel_search_filters.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rx_bloc_list/src/models/paginated_list.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakePaginatedList<E> extends _i1.Fake implements _i2.PaginatedList<E> {}

class _FakeHotel extends _i1.Fake implements _i3.Hotel {}

class _FakeHotelFullExtraDetails extends _i1.Fake
    implements _i4.HotelFullExtraDetails {}

class _FakeCoordinatorEvents extends _i1.Fake implements _i5.CoordinatorEvents {
}

class _FakeCoordinatorStates extends _i1.Fake implements _i5.CoordinatorStates {
}

/// A class which mocks [PaginatedHotelsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPaginatedHotelsRepository extends _i1.Mock
    implements _i6.PaginatedHotelsRepository {
  MockPaginatedHotelsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.PaginatedList<_i3.Hotel>> getFavoriteHotelsPaginated(
          {int? pageSize, int? page}) =>
      (super.noSuchMethod(
              Invocation.method(#getFavoriteHotelsPaginated, [],
                  {#pageSize: pageSize, #page: page}),
              returnValue: Future<_i2.PaginatedList<_i3.Hotel>>.value(
                  _FakePaginatedList<_i3.Hotel>()))
          as _i7.Future<_i2.PaginatedList<_i3.Hotel>>);
  @override
  _i7.Future<_i2.PaginatedList<_i3.Hotel>> getHotelsPaginated(
          {_i8.HotelSearchFilters? filters, int? pageSize, int? page}) =>
      (super.noSuchMethod(
              Invocation.method(#getHotelsPaginated, [],
                  {#filters: filters, #pageSize: pageSize, #page: page}),
              returnValue: Future<_i2.PaginatedList<_i3.Hotel>>.value(
                  _FakePaginatedList<_i3.Hotel>()))
          as _i7.Future<_i2.PaginatedList<_i3.Hotel>>);
  @override
  _i7.Future<List<_i3.Hotel>> getFavoriteHotels() =>
      (super.noSuchMethod(Invocation.method(#getFavoriteHotels, []),
              returnValue: Future<List<_i3.Hotel>>.value(<_i3.Hotel>[]))
          as _i7.Future<List<_i3.Hotel>>);
  @override
  _i7.Future<_i2.PaginatedList<_i3.Hotel>> getHotels(
          {int? page, int? pageSize, _i8.HotelSearchFilters? filters}) =>
      (super.noSuchMethod(
              Invocation.method(#getHotels, [],
                  {#page: page, #pageSize: pageSize, #filters: filters}),
              returnValue: Future<_i2.PaginatedList<_i3.Hotel>>.value(
                  _FakePaginatedList<_i3.Hotel>()))
          as _i7.Future<_i2.PaginatedList<_i3.Hotel>>);
  @override
  _i7.Future<_i3.Hotel> favoriteHotel(_i3.Hotel? hotel, {bool? isFavorite}) =>
      (super.noSuchMethod(
          Invocation.method(#favoriteHotel, [hotel], {#isFavorite: isFavorite}),
          returnValue:
              Future<_i3.Hotel>.value(_FakeHotel())) as _i7.Future<_i3.Hotel>);
  @override
  _i7.Future<List<_i9.HotelExtraDetails>> fetchExtraDetails(
          List<String>? ids) =>
      (super.noSuchMethod(Invocation.method(#fetchExtraDetails, [ids]),
              returnValue: Future<List<_i9.HotelExtraDetails>>.value(
                  <_i9.HotelExtraDetails>[]))
          as _i7.Future<List<_i9.HotelExtraDetails>>);
  @override
  _i7.Future<_i4.HotelFullExtraDetails> fetchFullExtraDetails(
          String? hotelId) =>
      (super.noSuchMethod(Invocation.method(#fetchFullExtraDetails, [hotelId]),
              returnValue: Future<_i4.HotelFullExtraDetails>.value(
                  _FakeHotelFullExtraDetails()))
          as _i7.Future<_i4.HotelFullExtraDetails>);
}

/// A class which mocks [CoordinatorBlocType].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoordinatorBlocType extends _i1.Mock
    implements _i5.CoordinatorBlocType {
  MockCoordinatorBlocType() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.CoordinatorEvents get events =>
      (super.noSuchMethod(Invocation.getter(#events),
          returnValue: _FakeCoordinatorEvents()) as _i5.CoordinatorEvents);
  @override
  _i5.CoordinatorStates get states =>
      (super.noSuchMethod(Invocation.getter(#states),
          returnValue: _FakeCoordinatorStates()) as _i5.CoordinatorStates);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [CoordinatorEvents].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoordinatorEvents extends _i1.Mock implements _i5.CoordinatorEvents {
  MockCoordinatorEvents() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void hotelUpdated(_i3.Hotel? hotel) =>
      super.noSuchMethod(Invocation.method(#hotelUpdated, [hotel]),
          returnValueForMissingStub: null);
  @override
  void hotelsWithExtraDetailsFetched(List<_i3.Hotel>? hotels) => super
      .noSuchMethod(Invocation.method(#hotelsWithExtraDetailsFetched, [hotels]),
          returnValueForMissingStub: null);
}

/// A class which mocks [CoordinatorStates].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoordinatorStates extends _i1.Mock implements _i5.CoordinatorStates {
  MockCoordinatorStates() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Stream<_i3.Hotel> get onHotelUpdated =>
      (super.noSuchMethod(Invocation.getter(#onHotelUpdated),
          returnValue: Stream<_i3.Hotel>.empty()) as _i7.Stream<_i3.Hotel>);
  @override
  _i7.Stream<List<_i3.Hotel>> get onFetchedHotelsWithExtraDetails =>
      (super.noSuchMethod(Invocation.getter(#onFetchedHotelsWithExtraDetails),
              returnValue: Stream<List<_i3.Hotel>>.empty())
          as _i7.Stream<List<_i3.Hotel>>);
  @override
  _i7.Stream<List<_i3.Hotel>> get onHotelsUpdated =>
      (super.noSuchMethod(Invocation.getter(#onHotelsUpdated),
              returnValue: Stream<List<_i3.Hotel>>.empty())
          as _i7.Stream<List<_i3.Hotel>>);
}
