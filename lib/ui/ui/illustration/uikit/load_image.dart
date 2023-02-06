import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/ui/ui/illustration/model/points_model.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/criteria_point.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/illustration_bottomsheet.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class LoadImage extends StatefulWidget {
  final String pictureLink;

  const LoadImage({
    Key? key,
    required this.pictureLink,
  }) : super(key: key);

  @override
  State<LoadImage> createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => setState(() => isLoading = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isLoading)
          Center(
            child: SizedBox(
              width: 50.w,
              height: 50.w,
              child: CircularProgressIndicator(
                color: AppColors.orange,
                strokeWidth: 3.w,
              ),
            ),
          ),
        Stack(
          children: [
            Image.asset(
              'assets/media/illustrations/${widget.pictureLink}',
            ),
            for (final point in IllustrationsPoints.points
                .firstWhere(
                    (element) => element.illustration == widget.pictureLink)
                .points)
              Positioned(
                  top: point.top?.h,
                  left: point.left?.w,
                  right: point.right?.w,
                  bottom: point.bottom?.h,
                  child: CriteriaPoint(
                    onTap: () => showBottomSheet(
                      context: context,
                      // isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => IllustrationBottomSheet(point: point),
                    ),
                  )),
          ],
        )
      ],
    );
  }
}
