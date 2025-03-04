import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../components/date_time_card.dart';

class ConfigurationsCard extends StatelessWidget {
  const ConfigurationsCard(this.discount, {Key? key}) : super(key: key);
  final Discount discount;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);
    final expired = discount.endsAt != null && discount.endsAt!.isBefore(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).expansionTileTheme.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Configurations'),
          ),
          halfSpace,
          if (discount.startsAt != null)
            DateTimeCard(
              dateTime: discount.startsAt,
              dateText: 'Start',
              dateTimeTextStyle: mediumTextStyle,
              dateTextStyle: mediumTextStyle?.copyWith(color: lightWhite),
              borderColor: Colors.transparent,
            ),
          space,
          if (discount.endsAt != null)
            DateTimeCard(
              dateTime: discount.endsAt,
              dateText: 'Expiry',
              dateTimeTextStyle: mediumTextStyle?.copyWith(color: expired ? Colors.redAccent : null),
              dateTextStyle: mediumTextStyle?.copyWith(color: lightWhite),
              borderColor: Colors.transparent,
            ),
          if (discount.endsAt != null) space,
        ],
      ),
    );
  }
}
