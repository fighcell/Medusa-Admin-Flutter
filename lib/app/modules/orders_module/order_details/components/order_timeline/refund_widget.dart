import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';


class RefundWidget extends StatelessWidget {
  const RefundWidget(this.refund, {super.key, required this.currencyCode});
  final Refund refund;
  final String? currencyCode;

  @override
  Widget build(BuildContext context) {
    final durationDiff = DateTime.now().difference(refund.createdAt ?? DateTime.now());
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.money_off),
            const SizedBox(width: 12.0),
            Text(
              'Refund',
              style: smallTextStyle,
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.money_off,
              color: Colors.transparent,
            ),
            const SizedBox(width: 12.0),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DateTime.now().subtract(durationDiff).timeAgo()} ${refund.amount.formatAsPrice(currencyCode)}',
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ),
                  if (refund.reason != null)
                    Column(
                      children: [
                        const SizedBox(height: 6.0),
                        Text(
                          refund.reason?.name.capitalize ?? '',
                          style: smallTextStyle?.copyWith(color: lightWhite),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
