
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../common_utils/image_loader.dart';
import '../../../main.dart';
import '../../../res/gaps.dart';
import '../../../shared/error_widget.dart';
import '../../../shared/loading_widget.dart';
import 'cubit/about_cubit.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key, required this.page, required this.title})
      : super(key: key);
  final String title;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<AboutCubit>(
        create: (_) => AboutCubit()..getAbout(page),
        child: BlocConsumer<AboutCubit, AboutState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AboutSuccess) {
              final data = state.data.row;
              return Scaffold(
                  appBar: AppBar(
                    titleSpacing: 0.0,
                    title: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageLoader.loadDefaultWithPlaceHolder(
                                data?.image ?? '',
                                width: 200,
                                height: 200,
                                fit: BoxFit.fill),
                            Gaps.vGap10,
                            Text(
                              data?.body ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: appFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            } else if (state is AboutFailed) {
              return Center(
                  child: FailedWidget(
                failedMessage: state.message,
              ));
            } else {
              return const Padding(
                padding: EdgeInsets.fromLTRB(8, 100, 8, 8),
                child: LoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}
