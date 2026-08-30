import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class AppIcon extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  const AppIcon({super.key, this.width = 25, this.height = 25, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      AssetBytesLoader('assets/vector/icons/cros.svg.vec'),
      height: this.width,
      width: this.height,
      colorFilter: ColorFilter.mode(
        this.color ?? AppColors.brandTextColor,
        BlendMode.srcIn,
      ),
    );
  }
}
