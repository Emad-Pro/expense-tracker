import 'package:flutter/material.dart';

class DescriptionExpenseTextFormFiledWidget extends StatelessWidget {
  const DescriptionExpenseTextFormFiledWidget({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            labelText: 'Description',
          ),
        ),
      ),
    );
  }
}
