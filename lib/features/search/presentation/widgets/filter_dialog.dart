import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/global_button.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key, required this.callBack}) : super(key: key);
  final Function(OrdersStatus) callBack;

  @override
  Widget build(BuildContext context) {
    List<OrdersStatus> category = [
      OrdersStatus.news,
      OrdersStatus.completed,
      OrdersStatus.pending,
      OrdersStatus.shipping,
      OrdersStatus.rejected,
    ];

    OrdersStatus selectedCategory = category[0];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            FilterRow(
              filterName: 'status'.tr,
              initCategory: selectedCategory,
              category: category,
              selectedCategory: (OrdersStatus res) {
                selectedCategory = res;
              },
            ),
            GlobalButton(
                onTap: () {
                  Get.back();
                  callBack.call(selectedCategory);
                },
                text: 'ok'.tr)
          ],
        ),
      ),
    );
  }
}

class FilterRow extends StatefulWidget {
  const FilterRow({
    super.key,
    required this.filterName,
    required this.initCategory,
    required this.category,
    required this.selectedCategory,
  });

  final String filterName;
  final OrdersStatus initCategory;
  final List<OrdersStatus> category;
  final Function(OrdersStatus) selectedCategory;

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  OrdersStatus? selected;

  @override
  void initState() {
    selected = widget.initCategory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.filterName,
          style: const TextStyle(fontSize: 15, color: MColors.colorPrimary),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: MColors.colorPrimary),
                borderRadius: BorderRadius.circular(30)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<OrdersStatus>(
                isExpanded: true,
                dropdownColor: Colors.white,
                icon: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 30),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: MColors.colorPrimary,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                value: selected,
                onChanged: (OrdersStatus? newValue) {
                  if (newValue != null) {
                    selected = newValue;
                    widget.selectedCategory.call(newValue);
                    setState(() {});
                  }
                },
                items: widget.category
                    .map<DropdownMenuItem<OrdersStatus>>((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem.name.tr,
                      style: const TextStyle(fontFamily: 'Tajawal'),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
