import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const NoDataWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No data loaded. Please try again'),
          SizedBox(height: 16),
          FilledButton(onPressed: onPressed, child: Text('Try again')),
        ],
      ),
    );
  }
}
