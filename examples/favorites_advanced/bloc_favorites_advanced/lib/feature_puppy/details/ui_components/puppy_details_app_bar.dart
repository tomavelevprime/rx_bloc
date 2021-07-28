import 'package:bloc_sample/base/flow_builders/puppy_flow.dart';
import 'package:bloc_sample/feature_puppy/blocs/puppy_mark_as_favorite_bloc.dart';

import 'package:favorites_advanced_base/models.dart';
import 'package:favorites_advanced_base/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PuppyDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PuppyDetailsAppBar({
    required Puppy puppy,
    Key? key,
  })  : _puppy = puppy,
        super(key: key);

  final Puppy _puppy;

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const IconWithShadow(icon: Icons.arrow_back),
          onPressed: () => context.flow<PuppyFlowState>().complete(),
        ),
        backgroundColor: Colors.transparent,
        actions: _buildTrailingItems(context),
        elevation: 0,
      );

  List<Widget> _buildTrailingItems(BuildContext context) => [
        _buildFavoriteButton(context),
        _buildEditButton(context),
      ];

  Widget _buildFavoriteButton(BuildContext context) => _puppy.isFavorite
      ? IconButton(
          icon: const IconWithShadow(icon: Icons.favorite),
          onPressed: () => _markAsFavorite(context, false),
        )
      : IconButton(
          icon: const IconWithShadow(icon: Icons.favorite_border),
          onPressed: () => _markAsFavorite(context, true),
        );

  Widget _buildEditButton(BuildContext context) => IconButton(
        icon: const IconWithShadow(icon: Icons.edit),
        onPressed: () async {
          // WidgetsBinding.instance!.addPostFrameCallback((_) {
          context
              .flow<PuppyFlowState>()
              .update((state) => state.copyWith(manage: true, puppy: _puppy));
          // });
        },
      );

  void _markAsFavorite(BuildContext context, bool isFavorite) =>
      BlocProvider.of<PuppyMarkAsFavoriteBloc>(context)
          .add(PuppyMarkAsFavoriteEvent(puppy: _puppy, isFavorite: isFavorite));

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
