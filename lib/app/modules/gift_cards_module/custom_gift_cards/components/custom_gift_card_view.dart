import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../data/models/req/user_gift_card_req.dart';
import '../../../../data/models/store/gift_card.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_close_button.dart';
import '../../../components/adaptive_icon.dart';
import '../controllers/custom_gift_cards_controller.dart';
import 'package:flutter/services.dart';

class CustomGiftCardView extends GetView<CustomGiftCardsController> {
  const CustomGiftCardView(this.giftCard, {super.key});
  final GiftCard giftCard;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final isDisabled = giftCard.isDisabled ?? false;
    final bottomPadding =
        MediaQuery.of(context).viewPadding.bottom == 0 ? 20.0 : MediaQuery.of(context).viewPadding.bottom;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            leading: const AdaptiveCloseButton(),
            title: const Text('Custom Gift Card Details'),
            actions: [
              AdaptiveIcon(
                  onPressed: () async {
                    await showModalActionSheet<int>(
                        title: 'Manage Custom Gift Card',
                        context: context,
                        actions: <SheetAction<int>>[
                          const SheetAction(label: 'Edit details', key: 0),
                          SheetAction(label: isDisabled ? 'Enable' : 'Disable', isDestructiveAction: true, key: 1),
                        ]).then((value) async {
                      switch (value) {
                        case 0:
                          Get.back();
                          Get.toNamed(Routes.CREATE_UPDATE_CUSTOM_GIFT_CARD, arguments: giftCard);
                          break;
                        case 1:
                          await controller.updateCustomGiftCard(
                              id: giftCard.id!, userUpdateGiftCardReq: UserUpdateGiftCardReq(isDisabled: !isDisabled));
                          break;
                      }
                    });
                  },
                  icon: const Icon(Icons.more_horiz))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: giftCard.code ?? '')).then((_) {
                        Get.snackbar('Success', 'Gift card code copied', snackPosition: SnackPosition.BOTTOM);
                      });
                    },
                    child: Center(child: Chip(label: Text(giftCard.code ?? '', style: largeTextStyle)))),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Original amount', style: mediumTextStyle?.copyWith(color: lightWhite)),
                        Text(giftCard.value.formatAsPrice(giftCard.region?.currencyCode), style: mediumTextStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Balance', style: mediumTextStyle?.copyWith(color: lightWhite)),
                        Text(giftCard.balance.formatAsPrice(giftCard.region?.currencyCode), style: mediumTextStyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Region', style: mediumTextStyle?.copyWith(color: lightWhite)),
                        Text(giftCard.region?.name?.toUpperCase() ?? '', style: mediumTextStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Created', style: mediumTextStyle?.copyWith(color: lightWhite)),
                        Text(giftCard.createdAt.formatDate(), style: mediumTextStyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                InkWell(
                  onTap: () async {
                    await showOkCancelAlertDialog(
                            context: context,
                            title: isDisabled ? 'Enable' : 'Disable',
                            message: 'Are you sure you want to ${isDisabled ? 'enable' : 'disable'} this gift card?',
                            okLabel: 'Yes, ${isDisabled ? 'enable' : 'disable'}',
                            isDestructiveAction: true)
                        .then((result) async {
                      if (result == OkCancelResult.ok) {
                        await controller.updateCustomGiftCard(
                            id: giftCard.id!, userUpdateGiftCardReq: UserUpdateGiftCardReq(isDisabled: !isDisabled));
                      }
                    });
                  },
                  child: Ink(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status', style: mediumTextStyle?.copyWith(color: lightWhite)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Icon(Icons.circle, color: isDisabled ? Colors.red : Colors.green, size: 10),
                                Icon(Icons.circle,
                                    color: isDisabled ? Colors.red.withOpacity(0.17) : Colors.green.withOpacity(0.17),
                                    size: 24),
                              ],
                            ),
                            const SizedBox(width: 6.0),
                            Text(isDisabled ? 'Disabled' : 'Active', style: mediumTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}
