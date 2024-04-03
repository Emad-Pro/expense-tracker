import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCustomIconCategory extends StatelessWidget {
  const BuildCustomIconCategory({super.key, required this.categoryItem});
  final String categoryItem;
  @override
  Widget build(BuildContext context) {
    switch (categoryItem) {
      case "Medical":
        return const Icon(
          Icons.medical_services_outlined,
          color: Color.fromARGB(255, 155, 0, 212),
        );
      case "Food":
        return const Icon(
          Icons.food_bank_outlined,
          color: Color.fromARGB(255, 0, 212, 88),
        );
      case "Other":
        return const Icon(
          CupertinoIcons.doc_text,
          color: Color.fromARGB(255, 212, 60, 0),
        );
      case "Shopping":
        return const Icon(
          CupertinoIcons.shopping_cart,
          color: Color.fromARGB(255, 0, 99, 212),
        );
      default:
        return const SizedBox(); // Handle non-existent category
    }
  }
}
