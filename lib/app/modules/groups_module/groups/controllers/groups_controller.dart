import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/data/repository/customer_group/customer_group_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GroupsController extends GetxController {
  static final GroupsController instance = Get.find<GroupsController>();
  GroupsController({required this.customerGroupRepo});

  final CustomerGroupRepo customerGroupRepo;
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  RefreshController refreshController = RefreshController();
  final int _pageSize = 20;
  RxInt customerGroupsCount = 0.obs;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await customerGroupRepo.retrieveCustomerGroups(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'customers',
    });
    result.when((success) {
      final isLastPage = success.customerGroups!.length < _pageSize;
      customerGroupsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.customerGroups!);
      } else {
        final nextPageKey = pageKey + success.customerGroups!.length;
        pagingController.appendPage(success.customerGroups!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = 'Error loading customer groups \n ${error.message}';
      refreshController.refreshFailed();
    });
  }

  Future<void> deleteGroup({required String id}) async {
    loading();
    final result = await customerGroupRepo.deleteCustomerGroup(id: id);
    result.when((success) {
      pagingController.refresh();
      Get.snackbar('Success', 'Customer Group deleted', snackPosition: SnackPosition.BOTTOM);
    }, (error) => Get.snackbar('Failure, ${error.code ?? ''}', error.message)
    );

    dismissLoading();
  }
}
