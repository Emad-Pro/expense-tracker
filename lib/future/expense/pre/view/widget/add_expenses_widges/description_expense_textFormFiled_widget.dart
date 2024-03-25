import 'package:flutter/material.dart';

class DescriptionExpenseTextFormFiledWidget extends StatelessWidget {
  const DescriptionExpenseTextFormFiledWidget(
      {super.key,
      required this.descriptionController,
      required this.validator});

  final TextEditingController descriptionController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextFormField(
          controller: descriptionController,
          validator: validator,
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
