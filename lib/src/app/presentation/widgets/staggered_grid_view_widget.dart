import 'package:flutter/material.dart';

class StaggeredGridViewWidget extends StatelessWidget {
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;
  final ScrollController? controller;
  final IndexedWidgetBuilder indexedWidgetBuilder;

  const StaggeredGridViewWidget({
    Key? key,
    this.spacing = 0.0,
    this.aspectRatio = 0.4,
    this.offsetPercent = 0.4,
    required this.itemCount,
    required this.controller,
    required this.indexedWidgetBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemHeight = (width * offsetPercent) / aspectRatio;
        final height = constraints.maxHeight + itemHeight;

        return OverflowBox(
          minWidth: width,
          maxWidth: width,
          maxHeight: height,
          minHeight: height,
          alignment: Alignment.center,
          child: GridView.builder(
            itemCount: itemCount,
            controller: controller,
            padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (_, index) {
              return Transform.translate(
                offset: Offset(
                  0.0,
                  index.isOdd ? itemHeight * offsetPercent : 0.0,
                ),
                child: indexedWidgetBuilder(context, index),
              );
            },
          ),
        );
      },
    );
  }
}
