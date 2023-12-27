import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../common_utils/common_utils.dart';
import '../../../../res/gaps.dart';
import '../../data/product_details_entity.dart';
import '../../domain/product_details_repository.dart';

part 'poduct_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);


  int counter = 01;
  String chooseAttributePrice = '0.0';
  bool isRefresh = false;

  List<ProductDetailsDataRowAttributesChilds>? chosenAttributes = [];

  ProductDetailsRepository productDetailsRepository =
      ProductDetailsRepository();

  Future<void> getProductDetails(String id) async {
    if (isRefresh) {
      emit(ProductDetailsLoading());
    }

    final resul = await productDetailsRepository.getProductDetails(id);

    resul.fold((l) {
      emit(ProductDetailsFailed("empty_data".tr));
    }, (r) {
      if (r.data == null) {
        emit(ProductDetailsFailed("empty_data".tr));
      } else {
        r.data?.row?.attributes?.forEach((element) {
          if (element.childs != null && element.childs!.isNotEmpty) {
            chosenAttributes?.add(element.childs!.first);
          }
        });
        emit(ProductDetailsLoaded(r.data!.row!));
      }
    });
  }

  List<TableRow>? readOnlyAttributes(
      List<ProductDetailsDataRowAttributesReadOnly>? readOnlyAttributesList) {
    List<TableRow> fetch = [];
    for (int i = 0; i < readOnlyAttributesList!.length; i++) {
      for (int x = 0; x < readOnlyAttributesList[i].childs!.length; x++) {
        fetch.add(TableRow(children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              readOnlyAttributesList[i].title ?? '',
            ),
          ),
          (readOnlyAttributesList[i].title?.toLowerCase() == 'color' ||
                  readOnlyAttributesList[i].title?.toLowerCase() == 'اللون')
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        (readOnlyAttributesList[i].childs?[x].title ?? '')
                            .split('-')
                            .first,
                      ),
                      Gaps.hGap8,
                      Container(
                        decoration: BoxDecoration(
                            color: CommonUtils.getColorFromHex(
                                (readOnlyAttributesList[i].childs?[x].title ??
                                        '')
                                    .split('-')
                                    .last),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        width: 70,
                        height: 30,
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    readOnlyAttributesList[i].childs![x].title ?? '',
                  ),
                ),
        ]));
      }
    }
    return fetch;
  }

}
