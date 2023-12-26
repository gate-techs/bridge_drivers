import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:stream_transform/stream_transform.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';

import '../../../home/data/my_orders_response.dart';
import '../../domain/search_repository.dart';

part 'search_state.dart';

// EventTransformer<T> debounce<T>(Duration duration) {
//   return (events, mapper) => events.debounce(duration).switchMap(mapper);
// }

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  OrdersStatus? selectedFilter;

  void resetListConfig() {
    currentPageIndex = 1;
    isLastIndex = false;
    data?.clear();
  }

  SearchRepository mSearchRepository = SearchRepository();

  int currentPageIndex = 1;
  bool isLastIndex = false;

  List<MyOrdersDataRows>? data = [];
  int totalLength = 0;

  Future<void> getLastSearch({int pageIndex = 1, OrdersStatus? status}) async {
    // debounce(const Duration(milliseconds: 500));
    try {
      if (pageIndex == 1) {
        emit(SearchLoading());
      }

      final mResponse =
          await mSearchRepository.getSearchData(pageIndex: pageIndex,status: status);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(SearchError(left));
      }, (right) async {
        await EasyLoading.dismiss();

        if (right.length < 10) {
          isLastIndex = !isLastIndex;
        }
        data?.addAll(right);
        totalLength = data?.length ?? 0;
        emit(SearchLoaded(data!));
      });
    } catch (e) {
      await EasyLoading.dismiss();
      if (data != null && data!.isEmpty) {
        emit(SearchError("empty_data".tr));
      }
      Log.e(e.toString());
    }
  }

  Future<void> getSearch(String searchKeyWord,
      {int pageIndex = 1, OrdersStatus? status}) async {
    try {
      if (pageIndex == 1) {
        emit(SearchLoading());
      }

      final mResponse = await mSearchRepository.getSearchData(
          searchKeyWord: searchKeyWord, pageIndex: pageIndex, status: status);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(SearchError(left));
      }, (right) async {
        await EasyLoading.dismiss();

        if (right.length < 10) {
          isLastIndex = !isLastIndex;
        }
        data?.addAll(right);

        emit(SearchLoaded(data!));
      });
    } catch (e) {
      await EasyLoading.dismiss();
      if (data != null && data!.isEmpty) {
        emit(SearchError("empty_data".tr));
      }
      Log.e(e.toString());
    }
  }
}
