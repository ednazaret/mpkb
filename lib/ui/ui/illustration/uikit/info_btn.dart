import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';

class InfoBtn extends StatelessWidget {
  final VoidCallback onTap;

  const InfoBtn({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Assets.images.infoBtn.svg(
        width: 38.w,
        height: 38.w,
      ),
    );
  }
}
