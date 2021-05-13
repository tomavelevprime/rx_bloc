part of 'home_page.dart';

List<RxBlocProvider> _getProviders() => [
      RxBlocProvider<FavoriteHotelsBlocType>(
        create: (context) => FavoriteHotelsBloc(context.read(), context.read()),
      ),
      RxBlocProvider<HotelManageBlocType>(
        create: (context) => HotelManageBloc(context.read(), context.read()),
      ),
      RxBlocProvider<HotelsExtraDetailsBlocType>(
        create: (context) =>
            HotelsExtraDetailsBloc(context.read(), context.read()),
      ),
      RxBlocProvider<NavigationBarBlocType>(
        create: (context) => NavigationBarBloc(),
      ),
    ];
