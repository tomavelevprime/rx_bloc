// Mocks generated by Mockito 5.0.3 from annotations
// in redux_favorite_advanced_sample/test/feature_puppy/favorites/favorites_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:favorites_advanced_base/src/models/puppy.dart' as _i2;
import 'package:favorites_advanced_base/src/repositories/puppies_repository.dart'
    as _i4;
import 'package:favorites_advanced_base/src/utils/enums.dart' as _i6;
import 'package:image_picker_platform_interface/src/types/picked_file/picked_file.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakePuppy extends _i1.Fake implements _i2.Puppy {}

class _FakePickedFile extends _i1.Fake implements _i3.PickedFile {}

/// A class which mocks [PuppiesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPuppiesRepository extends _i1.Mock implements _i4.PuppiesRepository {
  MockPuppiesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.Puppy>> getPuppies({String? query = r''}) =>
      (super.noSuchMethod(Invocation.method(#getPuppies, [], {#query: query}),
              returnValue: Future.value(<_i2.Puppy>[]))
          as _i5.Future<List<_i2.Puppy>>);
  @override
  _i5.Future<List<_i2.Puppy>> getFavoritePuppies() => (super.noSuchMethod(
      Invocation.method(#getFavoritePuppies, []),
      returnValue: Future.value(<_i2.Puppy>[])) as _i5.Future<List<_i2.Puppy>>);
  @override
  _i5.Future<_i2.Puppy> favoritePuppy(_i2.Puppy? puppy, {bool? isFavorite}) =>
      (super.noSuchMethod(
          Invocation.method(#favoritePuppy, [puppy], {#isFavorite: isFavorite}),
          returnValue: Future.value(_FakePuppy())) as _i5.Future<_i2.Puppy>);
  @override
  _i5.Future<List<_i2.Puppy>> fetchFullEntities(List<String>? ids) =>
      (super.noSuchMethod(Invocation.method(#fetchFullEntities, [ids]),
              returnValue: Future.value(<_i2.Puppy>[]))
          as _i5.Future<List<_i2.Puppy>>);
  @override
  _i5.Future<_i2.Puppy> updatePuppy(String? puppyId, _i2.Puppy? newValue) =>
      (super.noSuchMethod(Invocation.method(#updatePuppy, [puppyId, newValue]),
          returnValue: Future.value(_FakePuppy())) as _i5.Future<_i2.Puppy>);
  @override
  _i5.Future<_i3.PickedFile?> pickPuppyImage(_i6.ImagePickerAction? source) =>
      (super.noSuchMethod(Invocation.method(#pickPuppyImage, [source]),
              returnValue: Future.value(_FakePickedFile()))
          as _i5.Future<_i3.PickedFile?>);
}
