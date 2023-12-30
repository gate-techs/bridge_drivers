import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../data/orders_entity.dart';
import '../../domain/orders_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  OrdersRepository mOrdersRepository = OrdersRepository();


  String newOrdersCount = '0';
  String totalOrdersCount = '0';

  int currentPageIndexNew = 1;
  bool isLastPageNew = false;
  int lastPageNew = 0;
  int listTotalNew = 0;

  bool isRefresh = false;

  List<OrdersDataRows> ordersListNew = [];

  OrdersRepository ordersRepository = OrdersRepository();

  Future<void> getOrdersCount() async {
    if (currentPageIndexNew == 1) {
      emit(HomeLoading());
    }
    final resul = await ordersRepository.getOrdersCount();
    resul.fold((l) {
      emit(HomeError("empty_data".tr));
    }, (r) {
      final List<OrdersDataRows> fetchedPosts = r.data?.rows ?? [];
      lastPageNew = r.data?.paginate?.lastPage ?? 1;
      listTotalNew = r.data?.paginate?.total ?? 0;
      if (r.data == null || r.data!.rows!.isEmpty) {
        emit(HomeError("empty_data".tr));
      } else {
        if (currentPageIndexNew == r.data!.paginate!.lastPage) {
          isLastPageNew = true;
        }
        if (fetchedPosts.isNotEmpty) {
          ordersListNew.addAll(fetchedPosts);
          fetchedPosts.clear();
          newOrdersCount = (r.data?.paginate?.total??'0').toString();
          emit(HomeLoaded(ordersListNew));
        }
      }
    });
  }


  int currentPageIndex = 1;
  bool isLastPage = false;
  int lastPage = 10;
  int listTotal = 0;


  List<OrdersDataRows> ordersList = [];




  Future<void> getOrders(Map<String, dynamic> prams) async {

    if (currentPageIndex == 1) {
      emit(HomeLoading());
    }
    final resul = await ordersRepository.getOrders(prams);
    resul.fold((l) {
      emit(HomeError("empty_data".tr));
    }, (r) {
      final List<OrdersDataRows> fetchedPosts = r.data?.rows ?? [];
      lastPage = r.data?.paginate?.lastPage ?? 1;
      listTotal = r.data?.paginate?.total ?? 0;
      if (r.data == null || r.data!.rows!.isEmpty) {
        emit(HomeError("empty_data".tr));
      } else {
        if (currentPageIndex == r.data!.paginate!.lastPage) {
          isLastPage = true;
        }
        if (fetchedPosts.isNotEmpty) {
          ordersList.addAll(fetchedPosts);
          fetchedPosts.clear();
          totalOrdersCount = (r.data?.paginate?.total??'0').toString();
          emit(HomeLoaded(ordersList));
        }
      }
    });
  }

}


