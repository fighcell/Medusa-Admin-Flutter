import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/regions_module/regions/controllers/regions_controller.dart';
import '../../../../../../data/models/store/region.dart';
import '../../../../../../data/models/store/shipping_option.dart';
import '../../../../../../data/repository/regions/regions_repo.dart';

class RegionDetailsController extends GetxController with StateMixin<Region> {
  RegionDetailsController({required this.regionsRepo, required this.shippingOptionsRepo});
  static RegionDetailsController get instance => Get.find<RegionDetailsController>();
  final RegionsRepo regionsRepo;
  final ShippingOptionsRepo shippingOptionsRepo;
  late String regionId;
  RxString regionName = 'Region'.obs;

  @override
  Future<void> onInit() async {
    regionId = Get.arguments ?? '';
    await loadRegion();
    super.onInit();
  }

  Future<void> loadRegion() async {
    change(null, status: RxStatus.loading());
    final result = await regionsRepo.retrieve(
      id: regionId,
      queryParams: {
        'expand': 'countries,tax_rates,payment_providers,fulfillment_providers',
      },
    );
    result.when(
      (success) {
        change(success.region!, status: RxStatus.success());
        regionName.value = success.region!.name!;
      },
      (error) => change(null, status: RxStatus.error(error.message)),
    );
  }

  Future<void> deleteShippingOption(String id, {bool returnShippingOption = false}) async {
    loading();
    final result = await shippingOptionsRepo.delete(id: id);
    await result.when((success) async {
      if (success.deleted ?? false) {
        dismissLoading();
        if (!returnShippingOption) {
          updateOptions();
        } else {
          updateReturnOptions();
        }
      } else {
        EasyLoading.showError('Error deleting shipping option');
      }
    }, (error) {
      debugPrint(error.toString());
      EasyLoading.showError('Error deleting shipping option');
    });
  }

  Future<void> deleteRegion() async {
    change(null, status: RxStatus.loading());
    final result = await regionsRepo.delete(id: regionId);
    result.when(
      (success) {
        if (success.deleted) {
          Get.back();
          EasyLoading.showSuccess('Region deleted');
          RegionsController.instance.pagingController.refresh();
        }
      },
      (error) async {
        debugPrint(error.toString());
        EasyLoading.showError('Error deleting region');
        await loadRegion();
      },
    );
  }

  Future<List<ShippingOption>?> retrieveShippingOptions({bool isReturn = false}) async {
    final result = await shippingOptionsRepo.retrieveAll(
      queryParams: {
        'region_id': regionId,
        'is_return': isReturn,
      },
    );

    return result.when(
      (success) {
        return success.shippingOptions;
      },
      (error) {
        debugPrint(error.toString());
        return null;
      },
    );
  }

  void updateReturnOptions() {
    update([1]);
  }

  void updateOptions() {
    update([0]);
  }
}
