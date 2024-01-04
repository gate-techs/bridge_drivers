import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/app_constants.dart';
import 'package:kishk_driver/features/driver_details/presentation/screen/driver_details_screen.dart';
import 'package:kishk_driver/features/main_screens/drivers/presentation/search_bloc/search_bloc.dart';
import 'package:kishk_driver/features/main_screens/drivers/presentation/widgets/drivers_item.dart';
import 'package:kishk_driver/main.dart';
import 'package:kishk_driver/res/styles.dart';
import 'package:kishk_driver/shared/error_widget.dart';
import 'package:kishk_driver/shared/result_widget/result_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../../../../res/m_colors.dart';
import '../../../../shared/loading_widget.dart';

class DriversSearchScreen extends StatefulWidget {
  const DriversSearchScreen({Key? key, required this.fromAssignDrivers,  this.orderId,}) : super(key: key);
  final bool fromAssignDrivers;
  final int? orderId;

  @override
  State<DriversSearchScreen> createState() => _DriversSearchScreenState();
}

class _DriversSearchScreenState extends State<DriversSearchScreen> {
  late DriversSearchBloc driversCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder< DriversSearchBloc,  DriversSearchState>(
      builder: (context, state) {
        driversCubit = context.read<DriversSearchBloc>();
        return Scaffold(
          appBar: AppBar (
            titleSpacing: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () =>  Get.back(result: {'refresh': true}),
            ),
            title: Text(
              "Drivers".tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w700,
              ),
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
                    cursorColor: MColors.colorPrimary,
                    autofocus: true,
                    onChanged: (value) {
                      if (value.length > 2) {
                        driversCubit.add(GetDriversDataEvent(data: {
                          'search': value,
                          'paginate': 20,
                          'mobile': true,
                        }));
                      }
                    },
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff212121),
                    ),
                    decoration: MStyles.textFieldStyle(
                        "searchDrivers".tr,
                        const Icon(TablerIcons.search, color: Colors.black),
                        null),
                  ),
                ),
              ),
            ),
          ),
          body: BlocBuilder<DriversSearchBloc, DriversSearchState>(
            builder: (context, state) {
              driversCubit = context.read<DriversSearchBloc>();
              switch (state.status) {
                case SearchStates.init:
                  return Center(
                      child: Lottie.asset('assets/lottie/no_searsh.json',
                          width: 250, height: 250));
                case SearchStates.loading:
                  return const LoadingWidget();
                case SearchStates.success:
                  final data = state.data;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ResultWidget(
                          title: '${'searchResult'.tr} (${data.length})',
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            addAutomaticKeepAlives: false,
                            itemCount: data.length,
                            itemBuilder: (ctx, index) {
                              return PhloxAnimations(
                                duration: appAnimationDuration,
                                fromX: 500,
                                child: InkWell(
                                  onTap: () async{
                                    if(widget.fromAssignDrivers == true){
                                      driversCubit.assignDriver(widget.orderId??-1,data[index]?.id??-1);
                                    }else{
                                      var res = await Get.to(() =>  DriverDetailsScreen(dataRows: data[index]!,));
                                      if (res['refresh'] == true) {}
                                    }
                              },
                              child: DriversItem(
                              driversItemDataRows: data[index]!,
                              ),
                              ),
                              );
                            }),

                      ],
                    ),
                  );
                case SearchStates.failed:
                  return FailedWidget(
                    failedMessage: state.errorMessage,
                  );
              }
            },
          ),
        );
      },
    );
  }
}