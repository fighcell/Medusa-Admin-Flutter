import 'package:get/get.dart';

import '../modules/auth_module/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth_module/reset_password/views/reset_password_view.dart';
import '../modules/auth_module/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth_module/sign_in/views/sign_in_view.dart';
import '../modules/collections_module/collection_details/bindings/collection_details_binding.dart';
import '../modules/collections_module/collection_details/views/collection_details_view.dart';
import '../modules/collections_module/collections/bindings/collections_binding.dart';
import '../modules/collections_module/create_collection/bindings/create_collection_binding.dart';
import '../modules/collections_module/create_collection/views/create_collection_view.dart';
import '../modules/components/countries/bindings/country_binding.dart';
import '../modules/components/countries/view/country_view.dart';
import '../modules/components/pick_products/bindings/pick_products_binding.dart';
import '../modules/components/pick_products/views/pick_products_view.dart';
import '../modules/customers_module/add_update_customer/bindings/update_customer_details_binding.dart';
import '../modules/customers_module/add_update_customer/views/update_customer_details_view.dart';
import '../modules/customers_module/customer_details/bindings/customer_details_binding.dart';
import '../modules/customers_module/customer_details/views/customer_details_view.dart';
import '../modules/customers_module/customers/bindings/customers_binding.dart';
import '../modules/customers_module/customers/views/customers_view.dart';
import '../modules/customers_module/transfer_order/bindings/transfer_order_binding.dart';
import '../modules/customers_module/transfer_order/views/transfer_order_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/discount_module/add_update_discount/bindings/add_update_discount_binding.dart';
import '../modules/discount_module/add_update_discount/views/add_update_discount_view.dart';
import '../modules/discount_module/discount_conditions/bindings/discount_conditions_binding.dart';
import '../modules/discount_module/discount_conditions/views/discount_conditions_view.dart';
import '../modules/discount_module/discount_details/bindings/discount_details_binding.dart';
import '../modules/discount_module/discount_details/views/discount_details_view.dart';
import '../modules/discount_module/discounts/bindings/discounts_binding.dart';
import '../modules/discount_module/discounts/views/discounts_view.dart';
import '../modules/discount_module/update_condition/bindings/update_condition_binding.dart';
import '../modules/discount_module/update_condition/views/update_condition_view.dart';
import '../modules/draft_orders_module/create_draft_order/bindings/create_draft_order_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_customer/bindings/pick_customer_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_customer/views/pick_customer_view.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_product_variants/bindings/pick_product_variants_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_product_variants/views/pick_product_vairants_view.dart';
import '../modules/draft_orders_module/create_draft_order/views/create_draft_order_view.dart';
import '../modules/draft_orders_module/draft_order_details/bindings/draft_order_details_binding.dart';
import '../modules/draft_orders_module/draft_order_details/views/draft_order_details_view.dart';
import '../modules/draft_orders_module/draft_orders/bindings/draft_orders_binding.dart';
import '../modules/gift_cards/bindings/gift_cards_binding.dart';
import '../modules/gift_cards/views/gift_cards_view.dart';
import '../modules/groups_module/create_update_group/bindings/create_update_group_binding.dart';
import '../modules/groups_module/create_update_group/views/create_update_group_view.dart';
import '../modules/groups_module/group_details/bindings/group_details_binding.dart';
import '../modules/groups_module/group_details/views/group_details_view.dart';
import '../modules/groups_module/groups/bindings/groups_binding.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/orders_module/order_details/bindings/order_details_binding.dart';
import '../modules/orders_module/order_details/views/order_details_view.dart';
import '../modules/orders_module/orders/bindings/orders_binding.dart';
import '../modules/pick_regions/bindings/pick_regions_binding.dart';
import '../modules/pick_regions/views/pick_regions_view.dart';
import '../modules/pricing_module/add_update_price_list/bindings/add_update_price_list_binding.dart';
import '../modules/pricing_module/add_update_price_list/views/add_update_price_list_view.dart';
import '../modules/pricing_module/price_list_details/bindings/price_list_details_binding.dart';
import '../modules/pricing_module/price_list_details/views/price_list_details_view.dart';
import '../modules/pricing_module/pricing/bindings/pricing_binding.dart';
import '../modules/pricing_module/pricing/views/pricing_view.dart';
import '../modules/products_module/add_update_product/bindings/add_update_product_binding.dart';
import '../modules/products_module/add_update_product/components/product_add_variant.dart';
import '../modules/products_module/add_update_product/views/add_update_product_view.dart';
import '../modules/products_module/product_details/bindings/product_details_binding.dart';
import '../modules/products_module/product_details/views/product_details_view.dart';
import '../modules/products_module/products/bindings/products_binding.dart';
import '../modules/settings_module/store_settings/currencies/bindings/currencies_binding.dart';
import '../modules/settings_module/store_settings/currencies/views/currencies_view.dart';
import '../modules/settings_module/store_settings/personal_information/bindings/personal_information_binding.dart';
import '../modules/settings_module/store_settings/personal_information/views/personal_information_view.dart';
import '../modules/settings_module/store_settings/regions/add_region/bindings/add_region_binding.dart';
import '../modules/settings_module/store_settings/regions/add_region/views/add_region_view.dart';
import '../modules/settings_module/store_settings/regions/bindings/regions_binding.dart';
import '../modules/settings_module/store_settings/regions/region_details/bindings/region_details_binding.dart';
import '../modules/settings_module/store_settings/regions/region_details/views/region_details_view.dart';
import '../modules/settings_module/store_settings/regions/views/regions_view.dart';
import '../modules/settings_module/store_settings/return_reasons/bindings/return_reasons_binding.dart';
import '../modules/settings_module/store_settings/return_reasons/create_update_return_reason/bindings/create_update_return_reason_binding.dart';
import '../modules/settings_module/store_settings/return_reasons/create_update_return_reason/views/create_update_return_reason_view.dart';
import '../modules/settings_module/store_settings/return_reasons/views/return_reasons_view.dart';
import '../modules/settings_module/store_settings/shipping/bindings/shipping_binding.dart';
import '../modules/settings_module/store_settings/shipping/views/shipping_view.dart';
import '../modules/settings_module/store_settings/store_details/bindings/store_details_binding.dart';
import '../modules/settings_module/store_settings/store_details/views/store_details_view.dart';
import '../modules/settings_module/store_settings/store_settings_view.dart';
import '../modules/settings_module/store_settings/tax_settings/bindings/tax_settings_binding.dart';
import '../modules/settings_module/store_settings/tax_settings/bindings/tax_settings_select_region_binding.dart';
import '../modules/settings_module/store_settings/tax_settings/views/tax_settings_select_region_view.dart';
import '../modules/settings_module/store_settings/tax_settings/views/tax_settings_view.dart';
import '../modules/settings_module/store_settings/team/bindings/team_binding.dart';
import '../modules/settings_module/store_settings/team/views/team_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.DASHBOARD, page: () => const DashboardView(), bindings: [
      DashboardBinding(),
      OrdersBinding(),
      DraftOrdersBinding(),
      ProductsBinding(),
      CustomersBinding(),
      CollectionsBinding(),
      GroupsBinding(),
      MoreBinding(),
      // CurrenciesBinding(),
    ], children: [
      GetPage(
        name: _Paths.ORDER_DETAILS,
        page: () => const OrderDetailsView(),
        binding: OrderDetailsBinding(),
      ),
      GetPage(
        name: _Paths.DRAFT_ORDER_DETAILS,
        page: () => const DraftOrderDetailsView(),
        binding: DraftOrderDetailsBinding(),
      ),
      GetPage(
        name: _Paths.CREATE_DRAFT_ORDER,
        page: () => const CreateDraftOrderView(),
        binding: CreateDraftOrderBinding(),
        fullscreenDialog: true,
      ),
      GetPage(
        name: _Paths.PRODUCT_DETAILS,
        page: () => const ProductDetailsView(),
        binding: ProductDetailsBinding(),
      ),
      GetPage(
        name: _Paths.ADD_UPDATE_PRODUCT,
        page: () => const AddUpdateProductView(),
        binding: AddUpdateProductBinding(),
        fullscreenDialog: true,
      ),
      GetPage(
        name: _Paths.STORE_DETAILS,
        page: () => const StoreDetailsView(),
        binding: StoreDetailsBinding(),
      ),
      GetPage(
        name: _Paths.CUSTOMER_DETAILS,
        page: () => const CustomerDetailsView(),
        binding: CustomerDetailsBinding(),
        children: [
          GetPage(
            name: _Paths.TRANSFER_ORDER,
            page: () => const TransferOrderView(),
            binding: TransferOrderBinding(),
            fullscreenDialog: true,
          ),
        ],
      ),
      GetPage(
        name: _Paths.CURRENCIES,
        page: () => const CurrenciesView(),
        binding: CurrenciesBinding(),
      ),
      GetPage(
        name: _Paths.COLLECTION_DETAILS,
        page: () => const CollectionDetailsView(),
        binding: CollectionDetailsBinding(),
      ),
      GetPage(
        name: _Paths.CREATE_COLLECTION,
        page: () => const CreateCollectionView(),
        binding: CreateCollectionBinding(),
        fullscreenDialog: true,
      ),
      GetPage(
        name: _Paths.REGIONS,
        page: () => const RegionsView(),
        binding: RegionsBinding(),
        children: [
          GetPage(
            name: _Paths.ADD_REGION,
            page: () => const AddRegionView(),
            binding: AddRegionBinding(),
          ),
          GetPage(
            name: _Paths.REGION_DETAILS,
            page: () => const RegionDetailsView(),
            binding: RegionDetailsBinding(),
          ),
        ],
      ),
      GetPage(
        name: _Paths.PERSONAL_INFORMATION,
        page: () => const PersonalInformationView(),
        binding: PersonalInformationBinding(),
      ),
      GetPage(
        name: _Paths.RETURN_REASONS,
        page: () => const ReturnReasonsView(),
        binding: ReturnReasonsBinding(),
        children: [
          GetPage(
            name: _Paths.CREATE_UPDATE_RETURN_REASON,
            page: () => const CreateUpdateReturnReasonView(),
            binding: CreateUpdateReturnReasonBinding(),
            fullscreenDialog: true,
          ),
        ],
      ),
      GetPage(
        name: _Paths.SHIPPING,
        page: () => const ShippingView(),
        binding: ShippingBinding(),
      ),
      GetPage(
        name: _Paths.TEAM,
        page: () => const TeamView(),
        binding: TeamBinding(),
      ),
      GetPage(
          name: _Paths.TAX_SETTINGS_SELECT_REGION,
          page: () => const TaxSettingsSelectRegionView(),
          binding: TaxSettingsSelectRegionBinding(),
          children: [
            GetPage(
              name: _Paths.TAX_SETTINGS,
              page: () => const TaxSettingsView(),
              binding: TaxSettingsBinding(),
            ),
          ]),
    ]),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERS,
      page: () => const CustomersView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: _Paths.DISCOUNTS,
      page: () => const DiscountsView(),
      binding: DiscountsBinding(),
    ),
    GetPage(
      name: _Paths.GIFT_CARDS,
      page: () => const GiftCardsView(),
      binding: GiftCardsBinding(),
    ),
    GetPage(
      name: _Paths.PRICING,
      page: () => const PricingView(),
      binding: PricingBinding(),
    ),
    GetPage(
      name: _Paths.STORE_SETTINGS,
      page: () => const StoreSettingsView(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      children: [
        GetPage(
          name: _Paths.RESET_PASSWORD,
          page: () => const ResetPasswordView(),
          binding: ResetPasswordBinding(),
          fullscreenDialog: true,
        ),
      ],
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD_VARIANT,
      page: () => const ProductAddVariant(),
      binding: ProductAddVariantBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.SELECT_COUNTRY,
      page: () => const SelectCountryView(),
      binding: SelectCountryBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT_VARIANTS,
      page: () => const PickProductVariantsView(),
      binding: PickProductVariantsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.PICK_CUSTOMER,
      page: () => const PickCustomerView(),
      binding: PickCustomerBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.CREATE_UPDATE_GROUP,
      page: () => const CreateUpdateGroupView(),
      binding: CreateUpdateGroupBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.GROUP_DETAILS,
      page: () => const GroupDetailsView(),
      binding: GroupDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_DISCOUNT,
      page: () => const AddUpdateDiscountView(),
      binding: AddUpdateDiscountBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.DISCOUNT_DETAILS,
      page: () => const DiscountDetailsView(),
      binding: DiscountDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PICK_REGIONS,
      page: () => const PickRegionsView(),
      binding: PickRegionsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.DISCOUNT_CONDITIONS,
      page: () => const DiscountConditionsView(),
      binding: DiscountConditionsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.UPDATE_CONDITION,
      page: () => const UpdateConditionView(),
      binding: UpdateConditionBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_CUSTOMER,
      page: () => const AddUpdateCustomerView(),
      binding: AddUpdateCustomerBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.PRICE_LIST_DETAILS,
      page: () => const PriceListDetailsView(),
      binding: PriceListDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_PRICE_LIST,
      page: () => const AddUpdatePriceListView(),
      binding: AddUpdatePriceListBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.PICK_PRODUCTS,
      page: () => const PickProductsView(),
      binding: PickProductsBinding(),
    ),
  ];
}
