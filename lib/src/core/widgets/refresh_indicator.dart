import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  final double? edgeOffset;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.edgeOffset,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      edgeOffset: edgeOffset ?? 0,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
