import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import '../../../main_screens/home/data/orders_entity.dart';
import '../../../main_screens/home/domain/orders_repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);

  final TextEditingController search = TextEditingController();
  int searchResults = 0;
  bool isGrade = false;
  bool isLastPage = false;
  int currentPageIndex = 1;
  int lastPage = 10;
  int listTotal = 0;
  int radioSelected = 1;
  String categoryId = '1';

  List<OrdersDataRows> ordersList = [];

  OrdersRepository ordersRepository = OrdersRepository();

  Future<void> getOrders(Map<String, dynamic> prams) async {
    searchResults = 0;
    if (currentPageIndex == 1) {
      emit(OrdersLoading());
    }
    final resul = await ordersRepository.getOrders(prams);
    resul.fold((l) {
      searchResults = 0;
      emit(OrdersFailed("empty_data".tr));
    }, (r) {
      final List<OrdersDataRows> fetchedPosts = r.data?.rows ?? [];
      lastPage = r.data?.paginate?.lastPage ?? 1;
      listTotal = r.data?.paginate?.total ?? 0;
      if (r.data == null || r.data!.rows!.isEmpty) {
        searchResults = 0;
        emit(OrdersFailed("empty_data".tr));
      } else {
        if (currentPageIndex == r.data!.paginate!.lastPage) {
          isLastPage = true;
        }
        if (fetchedPosts.isNotEmpty) {
          ordersList.addAll(fetchedPosts);
          fetchedPosts.clear();
          if (search.text.isNotEmpty) {
            searchResults = r.data?.paginate?.total ?? 0;
          } else {
            searchResults = 0;
          }
          emit(OrdersLoaded(ordersList));
        }
      }
    });
  }



  void getSearch(Map<String, dynamic> prams) async {
    emit( OrdersInitial());
    final resul = await ordersRepository.getOrders(prams);

    resul.fold((l) {
      searchResults = 0;
      emit( OrdersFailed(l));
    }, (r) {
      if (r.data == null || r.data!.rows!.isEmpty) {
        searchResults = 0;
        emit( OrdersFailed("empty_data".tr));
      } else {
        if (search.text.isNotEmpty) {
          searchResults = r.data?.paginate?.total ?? 0;
        } else {
          searchResults = 0;
        }

        emit( OrdersLoaded(r.data!.rows!));
      }
    });
  }
}
