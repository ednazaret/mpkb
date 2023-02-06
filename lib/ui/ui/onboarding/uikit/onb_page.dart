import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/onboarding/models/onb_info_model.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class OnbPage extends StatelessWidget {
  const OnbPage({Key? key, required this.info, this.center, this.smaller})
      : super(key: key);
  final OnbInfo info;
  final bool? center;
  final bool? smaller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (info.title != null)
            Positioned(
                top: 20.h,
                child: Container(
                  width: 531.w,
                  height: 431.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color.fromRGBO(0, 53, 99, 1),
                          Color.fromRGBO(0, 53, 99, 0),
                        ],
                        radius: 0.5,
                      )),
                )),
          Positioned(
            top: 170.h,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: info.pathToAsset == null
                    ? Container()
                    : Image.asset(
                        info.pathToAsset!,
                        width: smaller == true ? 300.w : 375.w,
                        filterQuality: FilterQuality.high,
                      )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: center == true ? 120.h : 0.h, bottom: 15.h),
                  child: info.title != null
                      ? Text(
                          info.title!,
                          textAlign: TextAlign.center,
                          style: AppTypography.mediumStyle.copyWith(
                            fontSize: 24.w,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Image.asset(
                            Assets.images.mainlogo.path,
                            width: 200.w,
                            height: 43.h,
                          ),
                        ),
                ),
                Expanded(
                  child: Text(
                    info.description ?? '',
                    textAlign: TextAlign.center,
                    style: AppTypography.regularStyle.copyWith(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
