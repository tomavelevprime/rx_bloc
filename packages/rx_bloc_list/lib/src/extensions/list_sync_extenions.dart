import 'package:rxdart/rxdart.dart';

import '../../models.dart';

typedef ConditionCallback<E> = Future<bool> Function(E model);

extension ModelManageEvents<E> on Stream<E> {
  Stream<List<E>> mapModelCreateEvents(
    Stream<List<E>> list, {
    required ConditionCallback<E> addToListCondition,
  }) =>
      _withLatestFromList(list).flatMap((tuple) async* {
        final createdModel = tuple.model;
        final list = tuple.list;

        if (await addToListCondition(createdModel)) {
          yield list.complexMergeWith([createdModel]);
          return;
        }

        yield list;
      });

  Stream<List<E>> mapModelUpdateEvents(
    Stream<List<E>> list, {
    required ConditionCallback<E> removeFromListCondition,
  }) =>
      _withLatestFromList(list).flatMap(
        (modelList) async* {
          final updatedModel = modelList.model;
          final list = modelList.list;

          final removeFromList = await removeFromListCondition(updatedModel);

          if (removeFromList) {
            yield list.complexRemoveFromList(updatedModel);
            return;
          }

          yield list.complexMergeWith([updatedModel]);
        },
      );

  Stream<List<E>> mapModelDeleteEvents(
    Stream<List<E>> list,
  ) =>
      _withLatestFromList(list).flatMap((tuple) async* {
        final deletedModel = tuple.model;
        final list = tuple.list;

        yield list.complexRemoveFromList(deletedModel);
      });

  Stream<_ModelList<E>> _withLatestFromList(Stream<List<E>> list) =>
      withLatestFrom<List<E>, _ModelList<E>>(
        list,
        (model, lastUpdatedList) => _ModelList(
          model: model,
          list: lastUpdatedList,
        ),
      );
}

extension _ListUtils<E> on List<E> {
  List<E> removeFromList(E model) {
    final list = [...this];
    list.remove(model);

    return list;
  }

  /// Merge the current list with the given list of [T].
  ///
  /// 1. In case that any of the provided [T] it not part of the current
  /// list, the returned result will include the entities from the provided [T]
  /// 2. [addIfNotExist] In case that any of the provided [T] it's not part of the
  /// current list it will be added at the end of the list.
  List<E> mergeWith(
    List<E> entities, {
    bool addIfNotExist = true,
  }) {
    var copiedList = [...this];

    for (var entity in entities) {
      copiedList = copiedList.mergeWithEntity(
        entity,
        addIfNotExist: addIfNotExist,
      );
    }

    return copiedList;
  }

  List<E> mergeWithEntity(
    E entity, {
    required addIfNotExist,
  }) {
    final index = indexOf(entity);

    if (index >= 0 && index < length) {
      replaceRange(index, index + 1, [entity]);
      return this;
    }

    if (addIfNotExist) {
      add(entity);
    }

    return this;
  }

  List<E> complexMergeWith(List<E> entities) {
    if (this is PaginatedList<E>) {
      final paginatedList = (this as PaginatedList<E>);

      return paginatedList.copyWith(
        list: paginatedList.mergeWith(entities),
      );
    }

    return mergeWith(entities);
  }

  List<E> complexRemoveFromList(E model) {
    if (this is PaginatedList<E>) {
      final paginatedList = (this as PaginatedList<E>);

      return paginatedList.copyWith(
        list: paginatedList.removeFromList(model),
        totalCount: paginatedList.totalCount == null
            ? null
            : paginatedList.totalCount! - 1,
      );
    }

    return removeFromList(model);
  }
}

class _ModelList<E> {
  final E model;
  final List<E> list;

  _ModelList({
    required this.model,
    required this.list,
  });
}
