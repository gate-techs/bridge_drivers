import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/main.dart';
import 'package:paginated_list/paginated_list.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../../../res/styles.dart';
import '../../../../../shared/error_widget.dart';
import '../../../../../shared/loading_widget.dart';
import '../../data/drivers_entity.dart';
import '../cubit/drivers_cubit.dart';
import '../drivers_search_screen.dart';
import '../search_bloc/search_bloc.dart';
import 'drivers_item.dart';

class SelectDriverScreen extends StatefulWidget {
  const SelectDriverScreen({Key? key, required this.orderId,}) : super(key: key);
  final int orderId;


  @override
  State<SelectDriverScreen> createState() => _SelectDriverScreenState();
}

class _SelectDriverScreenState extends State<SelectDriverScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back(result: {'refresh': true});
          Get.back(result: {'refresh': true});
        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),),
        title:  Text(
          'selectDriver'.tr,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: appFontFamily,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(0, 50),
          child: Center(
            child: Container(
              height: 40,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MColors.veryLightGray,
              ),
              child: TextFormField(
                readOnly: true,
                cursorColor: MColors.colorPrimary,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff212121),
                ),
                decoration: MStyles.textFieldStyle(
                    "searchDrivers".tr,
                    const Icon(TablerIcons.search, color: Colors.black),
                    null),
                onTap: () async{
                  var res = await Get.to(
                        () => BlocProvider(
                      create: (context) =>DriversSearchBloc(),
                      child: DriversSearchScreen(fromAssignDrivers: true,orderId:widget.orderId),),
                  );
                  if (res['refresh'] == true) {

                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) {
          return DriversCubit()..getDrivers({'paginate':30,'mobile' :true,});
        },
        child: BlocConsumer<DriversCubit, DriversState>(
          listener: (context, state) {},
          builder: (context, state) {
            DriversCubit driversCubit = DriversCubit.get(context);
            if (state is  DriversLoaded) {
              final data = state.drivers;
              return SafeArea(
                child: Scaffold(
                  backgroundColor: MColors.screensBackgroundColor,
                  body: RefreshIndicator(
                      backgroundColor: MColors.colorPrimaryLight,
                      onRefresh: () async {
                        driversCubit.driversList.clear();
                        driversCubit.isLastPage = false;
                        driversCubit.currentPageIndex = 1;
                        driversCubit
                            .getDrivers({

                          'mobile' :true,
                          'paginate': 30,
                          'page': driversCubit.currentPageIndex});
                      },
                      child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gaps.vGap10,
                              PaginatedList<DriversDataRows>(
                                  loadingIndicator: const LoadingWidget(),
                                  shrinkWrap: true,
                                  items: data,
                                  isRecentSearch: false,
                                  isLastPage: driversCubit.isLastPage,
                                  onLoadMore: (index) {
                                    if (!driversCubit.isLastPage) {
                                      driversCubit.getDrivers({
                                        'mobile' :true,
                                        'page': (++driversCubit.currentPageIndex).toString(),
                                        'paginate': 30,

                                      });
                                    }
                                  },
                                  builder: (DriversDataRows e, int index) {
                                    return  InkWell(
                                      onTap: () {
                                        driversCubit.assignDriver(widget.orderId, e.id??-1);
                                      },
                                      child: DriversItem(
                                        driversItemDataRows: e,
                                      ),
                                    );
                                  }),
                            ],
                          ))),
                ),
              );
            } else if (state is  DriversFailed) {
              return  RefreshIndicator(
                backgroundColor: MColors.colorPrimaryLight,
                onRefresh: () async {
                  driversCubit.driversList.clear();
                  driversCubit.isLastPage = false;
                  driversCubit.currentPageIndex = 1;
                  driversCubit
                      .getDrivers({
                    'mobile' :true,
                    'paginate': 30,
                    'page': driversCubit.currentPageIndex,
                  });
                  Get.back(result: {'refresh': true});
                },
                child: Center(
                    child: FailedWidget(
                      failedMessage: state.message,
                    )),
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      )
    );
  }
}
