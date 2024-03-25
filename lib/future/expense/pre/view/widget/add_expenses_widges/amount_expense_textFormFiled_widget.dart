import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountExpenseTextFormFiledWidget extends StatelessWidget {
  const AmountExpenseTextFormFiledWidget(
      {super.key, required this.amountController, required this.validator});

  final TextEditingController amountController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextFormField(
          validator: validator,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*$')),
          ],
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
