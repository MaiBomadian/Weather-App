import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'There is no weather😔start',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          'searching now 🔍',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
