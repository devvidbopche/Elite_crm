part of sizer;

class SizerUtil {
  /// Device's BoxConstraints

  /// Device's Orientation

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Sets the Screen's size and Device's Orientation,


  //for responsive web
  static getWebResponsiveSize({smallSize, mediumSize, largeSize}) {
    return width < 600
        ? smallSize //'phone'
        : width >= 600 && width <= 1024
        ? mediumSize //'tablet'
        : largeSize; //'desktop';
  }

  static void setScreenSize(BoxConstraints constraints, Orientation orientation) {}
}

/// Type of Device
///
/// This can be either mobile or tablet
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
