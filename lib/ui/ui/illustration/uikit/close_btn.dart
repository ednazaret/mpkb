import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Кнопка закрытия для экрана иллюстраций
class CloseBtn extends StatelessWidget {
  final VoidCallback onTap;

  const CloseBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 38.w,
        height: 38.w,
        decoration: const BoxDecoration(
          color: AppColors.mainBlue,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.clear,
          color: AppColors.white,
        ),
      ),
    );
  }
}
