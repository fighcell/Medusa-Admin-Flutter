import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/draft_order_details/controllers/draft_order_details_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../data/models/store/draft_order.dart';

class DraftOrderPayment extends GetView<DraftOrderDetailsController> {
  const DraftOrderPayment(this.draftOrder, {Key? key, this.onExpansionChanged}) : super(key: key);
  final DraftOrder draftOrder;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    const halfSpace = Gap(6);
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final currencyCode = draftOrder.cart!.region!.currencyCode;

    return CustomExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Payment'),
      trailing: draftOrder.status! == DraftOrderStatus.open
          ? AdaptiveButton(
              onPressed: () async {
                await showOkCancelAlertDialog(
                  context: context,
                  title: 'Mark as paid',
                  message: 'This will create an order. Mark this as paid if you received the payment.',
                  okLabel: 'Mark paid',
                  cancelLabel: 'Cancel',
                ).then((value) async {
                  if (value == OkCancelResult.ok) {
                    await controller.markAsPaid();
                  }
                });
              },
              padding: EdgeInsets.zero,
              child: const Text('Mark as paid'))
          : null,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: mediumTextStyle),
              Row(
                children: [
                  Text(draftOrder.cart?.subTotal.formatAsPrice(currencyCode) ?? '', style: mediumTextStyle),
                  // Text(' ${draftOrder.currencyCode?.toUpperCase() ?? ''}',
                  //     style: mediumTextStyle?.copyWith(color: lightWhite)),
                ],
              ),
            ],
          ),
        ),
        halfSpace,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping', style: mediumTextStyle),
              Text(draftOrder.cart?.shippingTotal.formatAsPrice(currencyCode) ?? '', style: mediumTextStyle),
            ],
          ),
        ),
        halfSpace,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax', style: mediumTextStyle),
              Text(draftOrder.cart?.taxTotal.formatAsPrice(currencyCode) ?? '', style: mediumTextStyle),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: largeTextStyle),
              Text(draftOrder.cart?.total.formatAsPrice(currencyCode) ?? '', style: largeTextStyle),
            ],
          ),
        ),
        space,
        Text('Payment link : Configure payment link in store settings',
            style: smallTextStyle?.copyWith(color: lightWhite)),
      ],
    );
  }
}
