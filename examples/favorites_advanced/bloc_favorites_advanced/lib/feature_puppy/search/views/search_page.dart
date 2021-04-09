import 'package:bloc_sample/feature_puppy/blocs/puppies_extra_details_bloc.dart';
import 'package:bloc_sample/feature_puppy/favorites/blocs/favorite_puppies_bloc.dart';
import 'package:bloc_sample/feature_puppy/search/blocs/puppy_list_bloc.dart';
import 'package:favorites_advanced_base/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:favorites_advanced_base/resources.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const searchPage = 'Search page';

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PuppyListBloc, PuppyListState>(
          // buildWhen: (previous, current) {
          //   final result = previous.status != current.status;
          //   print('buildWhen current.status : ${current.status}');
          //   print('RESULT : $result');
          //   return result;
          // },
          key: const Key(Keys.puppySearchPage),
          builder: (context, state) {
            // print('BlocBuilder builder: ${state.status}');
            switch (state.status) {
              case PuppyListStatus.initial:
                return _buildPuppyListStatusInitial(context);
              case PuppyListStatus.failure:
                return _buildPuppyListStatusFailure();
              case PuppyListStatus.success:
                return _buildPuppyListStatusReloading(context, state);
              default:
                return _buildPuppyListStatusFailure();
            }
          });

  RefreshIndicator _buildPuppyListStatusReloading(
          BuildContext context, PuppyListState state) =>
      RefreshIndicator(
        onRefresh: () {
          context.read<PuppyListBloc>().add(ReloadPuppiesEvent());
          return Future.delayed(const Duration(seconds: 1));
        },
        child: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 67),
              itemCount: state.searchedPuppies!.length,
              itemBuilder: (context, index) {
                final item = state.searchedPuppies![index];
                // print('PuppyListStatus  : ${state.status}');
                return PuppyCard(
                  key: Key('${Keys.puppyCardNamePrefix}${item.id}'),
                  onVisible: (puppy) => context
                      .read<PuppiesExtraDetailsBloc>()
                      .add(FetchPuppyExtraDetailsEvent(puppy)),
                  puppy: item,
                  onCardPressed: (puppy) {},
                  // When we click the favorite_border icon we receive
                  // isFavorite true
                  onFavorite: (puppy, isFavorite) => context
                      .read<FavoritePuppiesBloc>()
                      .add(FavoritePuppiesMarkAsFavoriteEvent(
                          puppy: puppy, isFavorite: isFavorite)),
                );
              }),
        ),
      );

  // Display try again button to reload
  Center _buildPuppyListStatusFailure() =>
      const Center(child: Text('failed to fetch puppies'));

// create error retry widget

  LoadingWidget _buildPuppyListStatusInitial(BuildContext context) {
    return LoadingWidget(
      key: const Key('LoadingWidget'),
    );
  }
}
