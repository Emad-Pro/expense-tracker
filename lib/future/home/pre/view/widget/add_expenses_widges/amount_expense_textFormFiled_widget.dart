import 'package:flutter/material.dart';

class AmountExpenseTextFormFiledWidget extends StatelessWidget {
  const AmountExpenseTextFormFiledWidget({
    super.key,
    required this.amountController,
  });

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextFormField(
          controller: amountController,
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelText: 'Enter Amount',
          ),
        ),
      ),
    );
  }
}
