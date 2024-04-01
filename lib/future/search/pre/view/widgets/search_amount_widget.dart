import 'package:flutter/material.dart';

class SearchAmountWidget extends StatelessWidget {
  const SearchAmountWidget(
      {super.key, required this.amountController, required this.hintText});

  final TextEditingController amountController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      margin: MediaQuery.of(context).padding.copyWith(top: 10, bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: TextFormField(
        controller: amountController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money_sharp),
            border: InputBorder.none,
            hintText: hintText),
      ),
    );
  }
}
