part of utils;

extension NumExtension on num {
  /// Get height amount to percentage of screen's height
  ///
  /// Eg: 10.h -> will take 10% of the screen's height
  double get h => this * Responsive.height / 100;

  /// Get height amount to percentage of screen's width
  ///
  /// Eg: 10.w -> will take 10% of the screen's width
  double get w => this * Responsive.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (Responsive.width / 3) / 100;
}
