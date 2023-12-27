import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../main.dart';
import '../../../../res/m_colors.dart';
import '../../data/product_details_entity.dart';
import '../cubit/poduct_details_cubit.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({super.key, required this.productDetailsDataRow, required this.productDetailsCubit});
  final ProductDetailsDataRow productDetailsDataRow;
  final ProductDetailsCubit productDetailsCubit;
  @override
  DescriptionWidgetState createState() => DescriptionWidgetState();
}

class DescriptionWidgetState extends State<DescriptionWidget> with SingleTickerProviderStateMixin {
   late TabController _tabController;
   bool  tableHaveItems = false;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);



    if(((widget.productDetailsCubit.readOnlyAttributes(widget.productDetailsDataRow.attributesReadOnly))!.isEmpty) ||
        ((widget.productDetailsCubit.readOnlyAttributes(widget.productDetailsDataRow.attributesReadOnly))) == []
    ){
        tableHaveItems = false;
    }else{
      tableHaveItems = true;
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  widget.productDetailsDataRow.attributesReadOnly!.isEmpty?
    widget.productDetailsDataRow.body == null ? Container() :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.productDetailsDataRow.body!=null || widget.productDetailsDataRow.body !='' )
        Text('description'.tr,
        style: const TextStyle(color: Colors.black,
          fontSize: 16,fontWeight: FontWeight.bold),),
        Text(widget.productDetailsDataRow.body??'',
          style: const TextStyle(color: Colors.black,
            fontSize: 14,),),
      ],
    )
        : tableHaveItems?
    widget.productDetailsDataRow.body == null ?Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('details'.tr,
          style: const TextStyle(color: Colors.black,
              fontSize: 16,fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Table(
              children:  widget.productDetailsCubit.readOnlyAttributes(widget.productDetailsDataRow.attributesReadOnly)??[]
          ),
        ),
      ],
    ):
    Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DefaultTabController(
          length: 2,
          child: Column(children: [
            TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: MColors.colorPrimary,indicatorColor: MColors.colorPrimary,
              labelStyle:TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w700,
              ),
            tabs:  <Widget>[
              Tab(
                text:'description'.tr,
              ),
              Tab(
                text:'details'.tr,
              )
            ],controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),SizedBox(
                height: 200,
            child: TabBarView(
              controller: _tabController,
              children:  <Widget>[
                Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.productDetailsDataRow.body??'',
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.black,
                            fontSize: 14,),),
                      ],
                    ),
                  ),
                ),
             Scrollbar(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 8.0),
                       child: Table(
                           children:  widget.productDetailsCubit.readOnlyAttributes(widget.productDetailsDataRow.attributesReadOnly)??[]
                        ),
                     ),
                   ],
                 ),
               ),
             ),
          ]
            )
          ),
          ]),
        ),
      ],
    ):
    widget.productDetailsDataRow.body == null ? Container() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.productDetailsDataRow.body!=null || widget.productDetailsDataRow.body !='' )
          Text('description'.tr,
            style: const TextStyle(color: Colors.black,
                fontSize: 16,fontWeight: FontWeight.bold),),
        Text(widget.productDetailsDataRow.body??'',
          style: const TextStyle(color: Colors.black,
            fontSize: 14,),),
      ],
    ) ;
  }
}