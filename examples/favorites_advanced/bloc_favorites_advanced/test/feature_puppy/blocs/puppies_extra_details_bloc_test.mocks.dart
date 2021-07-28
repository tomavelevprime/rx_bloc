// Mocks generated by Mockito 5.0.7 from annotations
// in bloc_sample/test/feature_puppy/blocs/puppies_extra_details_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:bloc/src/bloc.dart' as _i9;
import 'package:bloc/src/transition.dart' as _i8;
import 'package:bloc_sample/base/common_blocs/coordinator_bloc.dart' as _i4;
import 'package:favorites_advanced_base/src/models/puppy.dart' as _i2;
import 'package:favorites_advanced_base/src/repositories/puppies_repository.dart'
    as _i6;
import 'package:favorites_advanced_base/src/utils/enums.dart' as _i7;
import 'package:image_picker_platform_interface/src/types/picked_file/picked_file.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakePuppy extends _i1.Fake implements _i2.Puppy {}

class _FakePickedFile extends _i1.Fake implements _i3.PickedFile {}

class _FakeCoordinatorState extends _i1.Fake implements _i4.CoordinatorState {}

class _FakeStreamSubscription<T> extends _i1.Fake
    implements _i5.StreamSubscription<T> {}

/// A class which mocks [PuppiesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPuppiesRepository extends _i1.Mock implements _i6.PuppiesRepository {
  MockPuppiesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.Puppy>> getPuppies({String? query = r''}) =>
      (super.noSuchMethod(Invocation.method(#getPuppies, [], {#query: query}),
              returnValue: Future<List<_i2.Puppy>>.value(<_i2.Puppy>[]))
          as _i5.Future<List<_i2.Puppy>>);
  @override
  _i5.Future<List<_i2.Puppy>> getFavoritePuppies() =>
      (super.noSuchMethod(Invocation.method(#getFavoritePuppies, []),
              returnValue: Future<List<_i2.Puppy>>.value(<_i2.Puppy>[]))
          as _i5.Future<List<_i2.Puppy>>);
  @override
  _i5.Future<_i2.Puppy> favoritePuppy(_i2.Puppy? puppy, {bool? isFavorite}) =>
      (super.noSuchMethod(
          Invocation.method(#favoritePuppy, [puppy], {#isFavorite: isFavorite}),
          returnValue:
              Future<_i2.Puppy>.value(_FakePuppy())) as _i5.Future<_i2.Puppy>);
  @override
  _i5.Future<List<_i2.Puppy>> fetchFullEntities(List<String>? ids) =>
      (super.noSuchMethod(Invocation.method(#fetchFullEntities, [ids]),
              returnValue: Future<List<_i2.Puppy>>.value(<_i2.Puppy>[]))
          as _i5.Future<List<_i2.Puppy>>);
  @override
  _i5.Future<_i2.Puppy> updatePuppy(String? puppyId, _i2.Puppy? newValue) =>
      (super.noSuchMethod(Invocation.method(#updatePuppy, [puppyId, newValue]),
              returnValue: Future<_i2.Puppy>.value(_FakePuppy()))
          as _i5.Future<_i2.Puppy>);
  @override
  _i5.Future<_i3.PickedFile?> pickPuppyImage(_i7.ImagePickerAction? source) =>
      (super.noSuchMethod(Invocation.method(#pickPuppyImage, [source]),
              returnValue: Future<_i3.PickedFile?>.value(_FakePickedFile()))
          as _i5.Future<_i3.PickedFile?>);
}

/// A class which mocks [CoordinatorBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoordinatorBloc extends _i1.Mock implements _i4.CoordinatorBloc {
  MockCoordinatorBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.CoordinatorState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
          returnValue: _FakeCoordinatorState()) as _i4.CoordinatorState);
  @override
  _i5.Stream<_i4.CoordinatorState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i4.CoordinatorState>.empty())
          as _i5.Stream<_i4.CoordinatorState>);
  @override
  _i5.Stream<
      _i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>> transformEvents(
          _i5.Stream<_i4.CoordinatorEvent>? events,
          _i9.TransitionFunction<_i4.CoordinatorEvent, _i4.CoordinatorState>?
              transitionFn) =>
      (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue:
                  Stream<_i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>>.empty())
          as _i5.Stream<
              _i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>>);
  @override
  _i5.Stream<_i4.CoordinatorState> mapEventToState(
          _i4.CoordinatorEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i4.CoordinatorState>.empty())
          as _i5.Stream<_i4.CoordinatorState>);
  @override
  void add(_i4.CoordinatorEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i4.CoordinatorEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i4.CoordinatorState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i5.Stream<
      _i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>> transformTransitions(
          _i5.Stream<_i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>>?
              transitions) =>
      (super.noSuchMethod(
              Invocation.method(#transformTransitions, [transitions]),
              returnValue:
                  Stream<_i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>>.empty())
          as _i5.Stream<
              _i8.Transition<_i4.CoordinatorEvent, _i4.CoordinatorState>>);
  @override
  _i5.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(null),
      returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.StreamSubscription<_i4.CoordinatorState> listen(
          void Function(_i4.CoordinatorState)? onData,
          {Function? onError,
          void Function()? onDone,
          bool? cancelOnError}) =>
      (super.noSuchMethod(
              Invocation.method(#listen, [
                onData
              ], {
                #onError: onError,
                #onDone: onDone,
                #cancelOnError: cancelOnError
              }),
              returnValue: _FakeStreamSubscription<_i4.CoordinatorState>())
          as _i5.StreamSubscription<_i4.CoordinatorState>);
  @override
  void onChange(_i8.Change<_i4.CoordinatorState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}
