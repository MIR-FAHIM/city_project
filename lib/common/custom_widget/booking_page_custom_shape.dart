
import 'package:cityproject/common/custom_widget/booking_page_custom_carve_edges.dart';
import 'package:flutter/material.dart';


class CustomClipShapeWidgets extends StatelessWidget {
  const CustomClipShapeWidgets({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurveEdges(),
      child: child,
    );
  }
}