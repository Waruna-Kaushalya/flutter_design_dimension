part of 'flutter_design_dimension.dart';

extension BuildContextDimension on BuildContext {
  double get mQHeight => MediaQuery.of(this).size.height;
  double get mQWidth => MediaQuery.of(this).size.width;

  double get mQAppBarHeight => AppBar().preferredSize.height;
  double get mQPaddingTopHeight => MediaQuery.of(this).padding.top;
  double get mQPaddingBottomHeight => MediaQuery.of(this).padding.bottom;

  double get mQActualSafeAreaHeight =>
      mQHeight - (mQAppBarHeight + mQPaddingTopHeight + mQPaddingBottomHeight);
}
