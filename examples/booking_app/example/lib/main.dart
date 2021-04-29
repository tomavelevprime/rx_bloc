import 'package:booking_app/base/common_blocs/coordinator_bloc.dart';
import 'package:booking_app/base/repositories/paginated_hotels_repository.dart';
import 'package:booking_app/feature_hotel/search/blocs/hotel_list_bloc.dart';
import 'package:booking_app/feature_hotel/search/models/capacity_filter_data.dart';
import 'package:booking_app/feature_hotel/search/models/date_range_filter_data.dart';
import 'package:booking_app/feature_hotel/search/ui_components/hotel_capacity_page.dart';
import 'package:example/stub.dart';
import 'package:example/widgets/card_header.dart';
import 'package:favorites_advanced_base/core.dart';
import 'package:favorites_advanced_base/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
        theme: DesignSystem.fromBrightness(context, Brightness.light).theme,
        darkTheme: DesignSystem.fromBrightness(context, Brightness.dark).theme,
        storyWrapperBuilder: (context, story, child) => Stack(
          children: [
            Container(
              padding: story.padding,
              color: DesignSystem.of(context).colors.backgroundColor,
              child: Center(child: child),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  story.name,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
        children: [
          Story(
            section: 'Buttons',
            name: 'Primary',
            builder: (ctx, k) => DialogButton(
              onPressed: () {},
              child: Text(
                k.text(label: 'Text', initial: 'Apply'),
                style: DesignSystem.of(ctx).typography.buttonMain,
              ),
            ),
          ),
          Story(
            section: 'Buttons',
            name: 'Icon',
            builder: (ctx, k) => _buildIconButtons(ctx, k),
          ),
          Story.simple(
            name: 'Search field',
            child: SearchBar(controller: TextEditingController()),
          ),
          Story(
            section: 'Common',
            name: 'Distance',
            builder: (ctx, k) => Row(
              children: [
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 12,
                  color: DesignSystem.of(ctx).colors.primaryIconColor,
                ),
                const SizedBox(width: 4),
                SkeletonText(
                  text: 'km to city',
                  style: DesignSystem.of(ctx).typography.subtitle2,
                  height: 18,
                ),
              ],
            ),
          ),
          Story(
            section: 'Common',
            name: 'Stars',
            builder: (ctx, k) => SmoothStarRating(
              allowHalfRating: true,
              starCount: 5,
              rating: 4.7,
              size: 20,
              color: DesignSystem.of(ctx).colors.primaryIconColor,
              borderColor: DesignSystem.of(ctx).colors.primaryIconColor,
            ),
          ),
          Story(
            section: 'Common',
            name: 'Chip',
            builder: (ctx, k) => _buildChip(ctx),
          ),
          Story.simple(
            name: 'Capacity filter',
            child: _buildCapacityFilter(),
          ),
          Story.simple(
            name: 'Date Range filter',
            child: _buildDateRangeFilter(),
          ),
          Story.simple(
              padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
              name: 'ShadowCard',
              child: _buildShadowCard(context))
        ],
      );
}

Widget _buildIconButtons(BuildContext context, KnobsBuilder k) => FocusButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: <Widget>[
            Text(
              k.text(label: 'Text', initial: 'Sort'),
              style: DesignSystem.of(context).typography.headline4,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                k.options(
                  label: 'Style',
                  initial: DesignSystem.of(context).icons.sort,
                  options: [
                    Option('Sort', DesignSystem.of(context).icons.sort),
                    Option('Search', DesignSystem.of(context).icons.search),
                    Option('Add', DesignSystem.of(context).icons.add),
                    Option('Remove', DesignSystem.of(context).icons.remove),
                  ],
                ),
                color: DesignSystem.of(context).colors.primaryIconColor,
              ),
            ),
          ],
        ),
      ),
    );

Widget _buildChip(BuildContext context) => Row(
      children: [
        Chip(
          backgroundColor: DesignSystem.of(context).colors.chipBackgroundColor,
          label: Text(
            'WiFI',
            style: DesignSystem.of(context).typography.chipTitle,
          ),
        ),
        Chip(
          backgroundColor: DesignSystem.of(context).colors.chipBackgroundColor,
          label: Text(
            'Air Conditioning',
            style: DesignSystem.of(context).typography.chipTitle,
          ),
        ),
        Chip(
          backgroundColor: DesignSystem.of(context).colors.chipBackgroundColor,
          label: Text(
            'Air Conditioning',
            style: DesignSystem.of(context).typography.chipTitle,
          ),
        ),
      ],
    );

Widget _buildShadowCard(BuildContext context) => Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: Theme.of(context).brightness == Brightness.light
                ? <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 16,
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Material(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      HotelImage(
                        hotel: hotel,
                        aspectRatio: 2,
                      ),
                      CardHeader(
                          hotel: hotel, padding: const EdgeInsets.all(2)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

Widget _buildCapacityFilter() => _buildProviders(_buildCapacityFilterBody());

Widget _buildCapacityFilterBody() =>
    RxBlocBuilder<HotelListBlocType, CapacityFilterData>(
      state: (bloc) => bloc.states.capacityFilterData,
      builder: (context, capacityFilterDataState, bloc) {
        final capacityData = capacityFilterDataState.data;
        final capacityFilterText = capacityData?.text ?? 'None';
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FocusButton(
              onPressed: () {
                Alert(
                  context: context,
                  title: '',
                  buttons: [],
                  onWillPopActive: true,
                  alertAnimation:
                      (context, animation, secondaryAnimation, child) =>
                          alertAnimation(animation, child),
                  content: HotelCapacityPage(
                    roomCapacity: capacityData?.rooms ?? 0,
                    personCapacity: capacityData?.persons ?? 0,
                    onApplyPressed: (rooms, persons) {
                      bloc.events.filterByCapacity(
                        roomCapacity: rooms,
                        personCapacity: persons,
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ).show();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Capacity filters',
                    style: DesignSystem.of(context).typography.headline4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    capacityFilterText,
                    style: DesignSystem.of(context).typography.headline5,
                  ),
                ],
              ),
            ),
            if (capacityFilterText != 'None')
              _buildClearButton(context, () {
                showYesNoMessage(
                  context: context,
                  title: 'Clear capacity filter?',
                  onYesPressed: () {
                    bloc.events.filterByCapacity(
                      roomCapacity: 0,
                      personCapacity: 0,
                    );
                  },
                );
              }),
          ],
        );
      },
    );

Widget _buildClearButton(BuildContext context, VoidCallback? onPressed) =>
    FocusButton(
      onPressed: onPressed ?? () {},
      child: Icon(DesignSystem.of(context).icons.cancel,
          color: DesignSystem.of(context).colors.primaryColor),
    );

Widget _buildDateRangeFilter() => _buildProviders(_buildDateRangeBodyFilter());

Widget _buildDateRangeBodyFilter() =>
    RxBlocBuilder<HotelListBlocType, DateRangeFilterData>(
      state: (bloc) => bloc.states.dateRangeFilterData,
      builder: (context, dateRangeFilterDataState, bloc) {
        final dateRangeText = dateRangeFilterDataState.data?.text ?? 'None';
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FocusButton(
              onPressed: () async {
                final pickedRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1, 12, 31),
                  saveText: 'Apply',
                );
                if (pickedRange == null) return;
                bloc.events.filterByDateRange(
                  dateRange: pickedRange,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Choose date',
                    style: DesignSystem.of(context).typography.headline4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    dateRangeText,
                    style: DesignSystem.of(context).typography.headline5,
                  ),
                ],
              ),
            ),
            if (dateRangeText != 'None')
              _buildClearButton(context, () {
                showYesNoMessage(
                  context: context,
                  title: 'Clear date range?',
                  onYesPressed: () {
                    bloc.events.filterByDateRange(dateRange: null);
                  },
                );
              }),
          ],
        );
      },
    );

Widget _buildProviders(Widget child) => RxMultiBlocProvider(
      providers: [
        RxBlocProvider<CoordinatorBlocType>(
          create: (context) => CoordinatorBloc(),
        ),
        RxBlocProvider<HotelListBlocType>(
          create: (context) => HotelListBloc(
            PaginatedHotelsRepository(
                HotelsRepository(ConnectivityRepository())),
            CoordinatorBloc(),
          ),
        ),
      ],
      child: child,
    );
