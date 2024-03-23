import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/home/pre/view/widget/custom_icons_stack_widget.dart';

import 'package:flutter/material.dart';

class BuildItemListViewLastTestEnteries extends StatelessWidget {
  final ExpanseModelGetData expanseModelGetData;
  const BuildItemListViewLastTestEnteries({
    super.key,
    required this.expanseModelGetData,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          CustomIconsStackWidget(expanseModelGetData: expanseModelGetData),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expanseModelGetData.description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  expanseModelGetData.date!,
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(
            "${expanseModelGetData.amount} \$",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
