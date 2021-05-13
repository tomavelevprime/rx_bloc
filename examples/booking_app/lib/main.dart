import 'package:favorites_advanced_base/core.dart';
import 'package:favorites_advanced_base/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booking_app/feature_hotel/search/blocs/hotel_list_bloc.dart';

import 'base/common_blocs/coordinator_bloc.dart';
import 'base/repositories/paginated_hotels_repository.dart';
import 'feature_home/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FirebaseInitializer(
        child: MultiProvider(
          providers: [
            Provider<PaginatedHotelsRepository>(
              create: (context) => PaginatedHotelsRepository(
                HotelsRepository.withFirebaseDataSource(),
              ),
            ),
            Provider<CoordinatorBlocType>(
              create: (context) => CoordinatorBloc(),
            ),
            Provider<HotelListBlocType>(
              create: (context) => HotelListBloc(
                context.read(),
                context.read(),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'Booking app',
            home: HomePage.page(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: ColorStyles.scaffoldBackgroundColor,
            ),
          ),
        ),
      );
}
