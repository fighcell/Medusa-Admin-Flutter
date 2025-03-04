import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/components/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../data/models/req/user_order.dart';
import '../../../../data/models/store/order.dart';
import '../../../components/adaptive_button.dart';
import '../../orders/components/payment_status_label.dart';

class OrderPayment extends GetView<OrderDetailsController> {
  const OrderPayment(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final refunded = order.refunds != null && order.refunds!.isNotEmpty;
    const space = Gap(12);
    const halfSpace = Gap(6);
    final tr = context.tr;
    final mediumTextStyle = context.bodyMedium;
    final lightWhite = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;
    Widget? getButton() {
      switch (order.paymentStatus) {
        case PaymentStatus.refunded:
          return AdaptiveButton(
            onPressed: () async => await controller.capturePayment(),
            padding: EdgeInsets.zero,
            child: Text(tr.templatesCapturePayment),
          );
        case PaymentStatus.notPaid:
        case PaymentStatus.awaiting:
        case PaymentStatus.partiallyRefunded:
        case PaymentStatus.captured:
          return AdaptiveButton(
            onPressed: () async {
              final result =
                  await showBarModalBottomSheet(context: context, builder: (context) => OrderCreateRefund(order));
              if (result is UserCreateRefundOrdersReq) {
                await controller.createRefund(result);
              }
            },
            padding: EdgeInsets.zero,
            child: Text(tr.templatesRefund),
          );
        case PaymentStatus.canceled:
          break;
        case PaymentStatus.requiresAction:
          break;
      }
      return null;
    }

    return CustomExpansionTile(
      key: controller.paymentKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(tr.detailsPayment),
      trailing: getButton(),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerRight, child: PaymentStatusLabel(paymentStatus: order.paymentStatus)),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.payments!.first.id!,
                        style: mediumTextStyle,
                      ),
                      halfSpace,
                      if ((order.payments?.isNotEmpty ?? false) && order.payments?.first.capturedAt != null)
                        Text(
                            'on ${order.payments?.first.capturedAt.formatDate()} at ${order.payments?.first.capturedAt.formatTime()}',
                            style: mediumTextStyle!.copyWith(color: lightWhite)),
                    ],
                  ),
                ),
                Text(order.payments?.first.amount.formatAsPrice(order.currencyCode) ?? '', style: largeTextStyle),
              ],
            ),
            space,
            if (refunded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 12.0),
                      const Icon(Icons.double_arrow_rounded),
                      Text(
                        tr.detailsRefunded,
                        style: mediumTextStyle,
                      ),
                    ],
                  ),
                  Text('- ${order.refundedTotal.formatAsPrice(order.currencyCode)}', style: mediumTextStyle),
                ],
              ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tr.detailsTotalPaid, style: largeTextStyle),
            Text((refunded ? order.refundableAmount : order.payments?.first.amount).formatAsPrice(order.currencyCode),
                style: largeTextStyle),
          ],
        ),
      ],
    );
  }
}
