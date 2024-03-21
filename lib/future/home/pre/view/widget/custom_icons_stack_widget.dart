import 'package:flutter/material.dart';

class CustomIconsStackWidget extends StatelessWidget {
  const CustomIconsStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.2,
                    1.2,
                  ],
                ))),
        const Icon(
          Icons.medical_services_sharp,
          color: Colors.cyan,
        )
      ],
    );
  }
}
