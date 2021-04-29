import 'package:favorites_advanced_base/core.dart';
import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
    required this.hotel,
    required EdgeInsets? padding,
  })   : _padding = padding,
        super(key: key);

  final Hotel hotel;
  final EdgeInsets? _padding;

  @override
  Widget build(BuildContext context) => Container(
        color: DesignSystem.of(context).colors.containerColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        hotel.title,
                        textAlign: TextAlign.left,
                        style: DesignSystem.of(context).typography.subtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        padding: _padding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(hotel.description.toString(),
                                  style: DesignSystem.of(context)
                                      .typography
                                      .subtitle2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
