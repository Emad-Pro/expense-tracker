import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:flutter/material.dart';

class WhoPorject extends StatelessWidget {
  const WhoPorject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          """It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."""
              .tr(context),
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
