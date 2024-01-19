import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.grid_view_rounded,
          size: 24,
          color: Colors.black,
        ),
        Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.notifications)
          ],
        )
      ],
    );
  }
}
