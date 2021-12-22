import 'package:rxdart/rxdart.dart';

import '../model/result.dart';

extension ResultCastStreamX<E> on Stream<E> {
  /// Map the value of the stream to ResultSuccess<E>
  Stream<Result<E>> mapToResult({E Function(E)? mapper}) => map((data) {
        if (mapper != null) {
          return Result<E>.success(mapper(data));
        }

        return Result<E>.success(data);
      });

  /// Cast the give stream to a new one [Result] stream,
  /// as combining it with another [stream].
  ///
  /// Use [mapSuccess] to map the current stream with the
  /// given [stream] to a new [Result] stream.
  Stream<Result<R>> castResultWithLatestFrom<R>(
    Stream<Result<R>> stream,
    R Function(E, R) mapSuccess,
  ) {
    return withLatestFrom<Result<R>, Result<R>>(
      stream,
      (e, t) => t.castResult((data) => mapSuccess(e, data)),
    );
  }
}

extension ResultCastStream<E> on Stream<Result<E>> {
  /// Cast the current [Result] stream to a new [Result],
  /// which could by from different type.
  ///
  /// Use the [mapSuccess] to map the success from the current stream to the
  /// result stream.
  Stream<Result<T>> castResult<T>(T Function(E) mapSuccess) => map(
        (result) => result.castResult(mapSuccess),
      );

  /// Cast the current [Result] stream to a new [Result],
  /// which could by from different type.
  ///
  /// Use the [mapSuccess] callback to map the success from the current stream
  /// to the result stream in async manner.
  Stream<Result<T>> castResultAsync<T>(Future<T> Function(E) mapSuccess) =>
      asyncMap(
        (result) => result.castResultAsync(mapSuccess),
      );
}

extension ResultCast<E> on Result<E> {
  /// Cast the current [Result] to a new [Result],
  /// which could be from different type.
  Future<Result<T>> castResultAsync<T>(Future<T> Function(E) mapSuccess) async {
    final that = this;

    if (that is ResultSuccess<E>) {
      return Result<T>.success(await mapSuccess(that.data));
    }

    return _castResultToErrorOrLoading();
  }

  /// Cast the current [Result] to a new [Result],
  /// which could be from different type.
  Result<T> castResult<T>(T Function(E) mapSuccess) {
    final that = this;

    if (that is ResultSuccess<E>) {
      return Result<T>.success(mapSuccess(that.data));
    }

    return _castResultToErrorOrLoading();
  }

  Result<T> _castResultToErrorOrLoading<T>() {
    final that = this;

    if (that is ResultError<E>) {
      return Result<T>.error(that.error);
    }

    return Result<T>.loading();
  }
}
