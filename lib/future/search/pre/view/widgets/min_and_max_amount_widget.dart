import 'package:expense_tracker/future/search/pre/view/widgets/search_amount_widget.dart';
import 'package:flutter/material.dart';

class MinAndMaxAmountWidget extends StatelessWidget {
  const MinAndMaxAmountWidget({
    super.key,
    required this.startAmountController,
    required this.endAamountController,
  });

  final TextEditingController startAmountController;
  final TextEditingController endAamountController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchAmountWidget(
          amountController: startAmountController,
          hintText: "min Amount",
        ),
        Spacer(),
        SearchAmountWidget(
          amountController: endAamountController,
          hintText: "max Amount",
        ),
      ],
    );
  }
}
