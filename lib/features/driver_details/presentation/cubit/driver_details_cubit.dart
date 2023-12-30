import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:meta/meta.dart';

import '../../data/driver_details_entity.dart';
import '../../domain/driver_details_repository.dart';

part 'driver_details_state.dart';

class DriverDetailsCubit extends Cubit<DriverDetailsState> {
  DriverDetailsCubit() : super(DriverDetailsInitial());


  static DriverDetailsCubit get(context) => BlocProvider.of(context);

  DriverDetailsRepository driverDetailsRepository = DriverDetailsRepository();


  int currentPageIndex = 1;
  bool isLastPage = false;
  int lastPage = 10;
  int listTotal = 0;



  List<DriverDetailsDataRows> ordersList = [];




  Future<void> getOrders(String id) async {

    if (currentPageIndex == 1) {
      emit(DriverDetailsLoading());
    }
    final resul = await driverDetailsRepository.getDriverOrders(id);
    resul.fold((l) {
      emit(DriverDetailsError("empty_data".tr));
    }, (r) {
      final List<DriverDetailsDataRows> fetchedPosts = r.data?.rows ?? [];
      lastPage = r.data?.paginate?.lastPage ?? 1;
      listTotal = r.data?.paginate?.total ?? 0;
      if (r.data == null || r.data!.rows!.isEmpty) {
        emit(DriverDetailsError("empty_data".tr));
      } else {
        if (currentPageIndex == r.data!.paginate!.lastPage) {
          isLastPage = true;
        }
        if (fetchedPosts.isNotEmpty) {
          ordersList.addAll(fetchedPosts);
          fetchedPosts.clear();

          emit(DriverDetailsLoaded(ordersList));
        }
      }
    });
  }
  
  
}
