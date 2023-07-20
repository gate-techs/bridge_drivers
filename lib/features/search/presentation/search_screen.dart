import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../home/data/my_orders_response.dart';
import 'cubit/search_cubit.dart';
import 'widgets/filter_dialog.dart';
import 'widgets/search_list_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchCubit? mSearchCubit;
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'.tr,
            style: const TextStyle(
                color: MColors.colorPrimary, fontFamily: 'Tajawal')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: Colors.black,
                    controller: mSearchCubit?.searchController,
                    decoration: InputDecoration(
                        fillColor: MColors.appInputColor,
                        filled: true,
                        hintText: 'search_hint'.tr,
                        prefixIcon: const Icon(
                          Iconsax.search_normal,
                          color: Colors.black,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            mSearchCubit?.searchController.clear();
                            mSearchCubit?.resetListConfig();
                            mSearchCubit?.getLastSearch();
                          },
                          child: const Icon(
                            Iconsax.close_circle,
                            color: Colors.black,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14),
                        hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Tajawal"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: MColors.appInputColor, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: MColors.appInputColor, width: 1.0))),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      mSearchCubit?.resetListConfig();
                      mSearchCubit?.getSearch(value);
                    },
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: 'filter'.tr,
                        titlePadding: const EdgeInsets.only(top: 16),
                        content: FilterDialog(
                          callBack: (OrdersStatus res) {
                            mSearchCubit?.resetListConfig();
                            mSearchCubit?.getLastSearch(status: res);
                          },
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Iconsax.filter_tick),
                  ))
            ],
          ),
          Gaps.vGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('${mSearchCubit?.totalLength ?? ''} ${'results'.tr} '),
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                mSearchCubit?.resetListConfig();
                mSearchCubit?.getLastSearch();
              },
              child: BlocProvider(
                create: (context) => SearchCubit()..getLastSearch(),
                child: BlocConsumer<SearchCubit, SearchState>(
                  listener: (context, state) {
                    if (state is SearchLoaded) {
                      setState(() {
                        length = mSearchCubit?.totalLength ?? 0;
                      });
                    }
                  },
                  builder: (context, state) {
                    mSearchCubit = SearchCubit.get(context);
                    if (state is SearchLoaded) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PaginatedList<MyOrdersDataRows>(
                          loadingIndicator: const AppLoadingWidget(),
                          shrinkWrap: true,
                          items: state.mDataList,
                          isRecentSearch: false,
                          isLastPage: mSearchCubit!.isLastIndex,
                          onLoadMore: (int index) {
                            if (!mSearchCubit!.isLastIndex) {
                              mSearchCubit?.getLastSearch(
                                  pageIndex: ++mSearchCubit!.currentPageIndex);
                            }
                          },
                          builder: (e, index) => SearchListItem(
                            data: state.mDataList[index],
                            refreshCallBack: () {
                              mSearchCubit?.resetListConfig();
                              mSearchCubit?.getLastSearch();
                            },
                          ),
                        ),
                      );
                    } else if (state is SearchError) {
                      return const EmptyDataWidget();
                    } else {
                      return const AppLoadingWidget();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
