import 'package:flutter/material.dart';

class DesignOverviewColorContainer extends StatelessWidget {
  DesignOverviewColorContainer({
    Key? key,
    required this.color,
    required this.topPadding,
  }) : super(key: key);
  Color color;
  final double topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 233,
        top: topPadding,
      ),
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: Theme.of(context).indicatorColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
