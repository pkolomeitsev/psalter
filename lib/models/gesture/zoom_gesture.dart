import 'package:flutter/cupertino.dart';
import 'package:orth_psalter/mixins/font_size_storage_mixin.dart';
import 'package:orth_psalter/models/enums/font_size.dart';

class ZoomGesture with FontSizeStorageMixin {
  bool isZoomIn(double value) {
    return (value > 1.0);
  }

  bool isZoomOut(double value) {
    return (value < 1.0);
  }

  Future<void> increaseFontSize() async {
    int fontSize = await this.getPsalterFontSize();

    if (fontSize >= (FontSize.values.length - 1)) {
      return;
    }

    fontSize++;
    this.setPsalterFontSize(fontSize);
  }

  Future<void> decreaseFontSize() async {
    int fontSize = await this.getPsalterFontSize();

    if (fontSize == 0) {
      return;
    }

    fontSize--;
    this.setPsalterFontSize(fontSize);
  }

  Future<void> onScaleUpdate(ScaleUpdateDetails scaleUpdateDetails) async {
    // don't update the UI if the scale didn't change
    if (scaleUpdateDetails.scale == 1.0) {
      return;
    }

    if (ZoomGesture().isZoomIn(scaleUpdateDetails.scale)) {
      ZoomGesture().increaseFontSize();
    }

    if (ZoomGesture().isZoomOut(scaleUpdateDetails.scale)) {
      ZoomGesture().decreaseFontSize();
    }
  }
}
