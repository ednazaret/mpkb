import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isInFav;
  final double? size;
  final Color? selectedColor;
  final Color? unselectedColor;

  const FavoriteButton({
    Key? key,
    required this.onTap,
    required this.isInFav,
    this.size,
    this.selectedColor,
    this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: isInFav
          ? Assets.images.staroutlined.svg(
              width: size ?? 24.w,
              height: size ?? 24.w,
              color: unselectedColor ?? AppColors.white,
            )
          : Assets.images.starfilled.svg(
              width: size ?? 24.w,
              height: size ?? 24.w,
              color: AppColors.orange,
            ),
    );
  }
}
