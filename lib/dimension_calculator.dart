part of 'flutter_design_dimension.dart';

extension HeightDimension on num {
  double get heightFactor => this * (safeAreaHeight / designCanvasHeightVal);
}

extension WidthDimension on num {
  double get widthFactor => this * (safeAreaWidth / designCanvasWidthVal);
}

double designCanvasHeightVal = 0;
double safeAreaHeight = 0;
double designCanvasWidthVal = 0;
double safeAreaWidth = 0;

class DimensionsData {
  bool isCalBottomBarHeight = true;
  bool isCalAppBarHeight = true;
  bool isCalTopBarHeight = true;
  void initDesignDimension(
    BuildContext context, {
    required double designCanvasHeight,
    required double designCanvasWidth,
    bool? calBottomBarHeight,
    bool? calAppBarHeight,
    bool? calTopBarHeight,
  }) {
    isCalBottomBarHeight = calBottomBarHeight ?? isCalBottomBarHeight;
    isCalAppBarHeight = calAppBarHeight ?? isCalAppBarHeight;
    isCalTopBarHeight = calTopBarHeight ?? isCalTopBarHeight;

    designCanvasHeightVal = designCanvasHeight;
    designCanvasWidthVal = designCanvasWidth;
    safeAreaHeight = _calculateSafeAreaHeight(context);
    safeAreaWidth = _calculateSafeAreaWidth(context);
  }

  double _calculateSafeAreaHeight(BuildContext context) {
    final fullScreenHeight = MediaQuery.of(context).size.height;
    final bottomBarHeight =
        isCalBottomBarHeight ? MediaQuery.of(context).padding.bottom : 0;
    final appBarHeight = isCalAppBarHeight ? AppBar().preferredSize.height : 0;
    final topBarHeight =
        isCalTopBarHeight ? MediaQuery.of(context).padding.top : 0;
    return fullScreenHeight - (bottomBarHeight + topBarHeight + appBarHeight);
  }

  double _calculateSafeAreaWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;

    // final fullScreenWidth = MediaQuery.of(context).size.width;
    // final verticalPadding = MediaQuery.of(context).padding.horizontal;
    // return fullScreenWidth - 2 * verticalPadding;
  }
}
