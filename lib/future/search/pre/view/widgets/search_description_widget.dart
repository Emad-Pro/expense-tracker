import 'package:flutter/material.dart';

class TextFormFiledSearchWidget extends StatelessWidget {
  const TextFormFiledSearchWidget(
      {super.key,
      required this.textFormFiledController,
      required this.hintText});

  final TextEditingController textFormFiledController;

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).viewPadding.copyWith(top: 10, bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: TextFormField(
        controller: textFormFiledController,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}
