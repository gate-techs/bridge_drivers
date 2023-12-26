import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../notifications/domain/notifications_repository.dart';
import '../../data/orders_entity.dart';
import '../../domain/orders_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  OrdersRepository mOrdersRepository = OrdersRepository();


  String newOrdersCount = '0';
  String totalOrdersCount = '0';

  int currentPageIndex = 1;
  bool isLastIndex = false;

  bool isGrade = false;
  bool isLastPage = false;
  int lastPage = 10;
  int listTotal = 0;
  int radioSelected = 1;
  String categoryId = '1';

  List<OrdersDataRows> ordersList = [];

  OrdersRepository ordersRepository = OrdersRepository();

  Future<void> getOrdersCount() async {
    if (currentPageIndex == 1) {
      emit(HomeLoading());
    }
    final resul = await ordersRepository.getOrdersCount();
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
          emit(HomeLoaded(ordersList));
        }
      }
    });
  }


  int badgeCount = 0;

  Future<void> getNotificationsCount() async {
    badgeCount = await NotificationsRepository()
        .getNotificationsCount()
        .then((value) async => value.fold((l) => l, (r) => r));
  }
}


