import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/controllers/orders_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'dart:io' show Platform;
import '../../../draft_orders_module/draft_orders/controllers/draft_orders_controller.dart';

class OrdersDraftTabBarAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OrdersDraftTabBarAppBar({
    super.key,
    required this.tabController,
    required this.topViewPadding,
  });

  final TabController tabController;
  final double topViewPadding;

  @override
  State<OrdersDraftTabBarAppBar> createState() => _OrdersDraftTabBarAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + topViewPadding);
}

class _OrdersDraftTabBarAppBarState extends State<OrdersDraftTabBarAppBar> {
  final OrdersController controller = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    final headlineMediumTextStyle = context.headlineMedium;

    final lightWhite = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;

    final productsText = Obx(() {
      final count = OrdersController.instance.ordersCount.value;
      return Text(count != 0 ? 'Orders ($count)' : 'Orders', overflow: TextOverflow.ellipsis);
    });
    final collectionText = Obx(() {
      final count = DraftOrdersController.instance.draftOrdersCount.value;
      return Text(count != 0 ? 'Drafts ($count)' : 'Drafts', overflow: TextOverflow.ellipsis);
    });

    final androidTabBar = TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(child: productsText),
        Tab(child: collectionText),
      ],
    );

    final iosTabBar = Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: CupertinoButton(
                      padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                      onPressed: () {
                        widget.tabController.index = 0;
                        setState(() {});
                      },
                      alignment: Alignment.bottomCenter,
                      child: AnimatedDefaultTextStyle(
                          style: widget.tabController.index == 0
                              ? headlineMediumTextStyle!
                              : largeTextStyle!.copyWith(color: lightWhite),
                          duration: const Duration(milliseconds: 200),
                          child: productsText)),
                ),
                Flexible(
                  child: CupertinoButton(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                    onPressed: () {
                      widget.tabController.index = 1;
                      setState(() {});
                    },
                    alignment: Alignment.bottomCenter,
                    child: AnimatedDefaultTextStyle(
                        style: widget.tabController.index == 1
                            ? headlineMediumTextStyle!
                            : largeTextStyle!.copyWith(color: lightWhite),
                        duration: const Duration(milliseconds: 200),
                        child: collectionText),
                  ),
                ),
              ],
            ),
          ),
          // if (widget.tabController.index == 0)
          //   AdaptiveButton(
          //       onPressed: () {}, padding: const EdgeInsets.symmetric(horizontal: 16.0), child: const Text('Export')),
          Hero(tag: 'medusa', child: Image.asset('assets/images/medusa.png')),
        ],
      ),
    );

    widget.tabController.addListener(() {
      setState(() {});});

    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: context.topViewPadding),
          if (Platform.isAndroid) androidTabBar,
          if (Platform.isIOS) iosTabBar,
        ],
      ),
    );
  }
}
