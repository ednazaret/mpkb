import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/ui/ui/favorite/bloc/favorites_cubit.dart';
import 'package:satefy_cage/ui/uikit/favorite_button.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class HurdleCard extends StatelessWidget {
  final Hurdle hurdle;
  final bool? isFav;
  final Color? customBackgroundColor;
  final Color? customBorderColor;
  final bool? regularTextStyle;
  final double? borderRadius;
  final bool? showFav;
  final bool? expandableText;
  final String? passportName;
  final EdgeInsets? customPadding;
  final VoidCallback? onTap;
  final bool? boldText;

  const HurdleCard({
    Key? key,
    required this.hurdle,
    this.isFav,
    this.customBackgroundColor,
    this.customBorderColor,
    this.borderRadius,
    this.onTap,
    this.customPadding,
    this.showFav,
    this.passportName,
    this.expandableText,
    this.boldText,
    this.regularTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customPadding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: customBackgroundColor ?? AppColors.white,
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : null,
            border: borderRadius == null
                ? Border(
                    bottom: BorderSide(
                    color: AppColors.paleBlueLight,
                    width: 1.h,
                  ))
                : null,
          ),
          padding: const EdgeInsets.only(
            left: 22,
            top: 14,
            right: 18,
            bottom: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.images.barriermini.path,
                    width: 24.w,
                    height: 24.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 14.w,
                      ),
                      child: Text(
                        hurdle.hurdle_id ?? '',
                        style: AppTypography.regularStyle.copyWith(
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                          color: AppColors.paleBlue,
                        ),
                      ),
                    ),
                  ),
                  if (showFav != false)
                    FavoriteButton(
                      onTap: () async => isFav == true
                          ? await context
                              .read<FavoritesCubit>()
                              .removeFromFav(favoriteId: hurdle.hurdle_id!)
                          : await context
                              .read<FavoritesCubit>()
                              .addToFav(favoriteId: hurdle.hurdle_id!),
                      isInFav: Hive.box<Favorites>('favorites')
                              .values
                              .first
                              .favoriteHurdles
                              ?.contains(hurdle.hurdle_id!) ==
                          false,
                      unselectedColor: AppColors.paleBlue,
                      size: 23.w,
                    ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              expandableText == true
                  ? ExpandableText(
                      text: hurdle.hurdle_name ?? '',
                      isBold: boldText,
                      needToExpand: countRows(context: context),
                    )
                  : Text(
                      hurdle.hurdle_name ?? '',
                      textAlign: TextAlign.start,
                      style: regularTextStyle == true
                          ? AppTypography.regularStyle.copyWith(
                              fontSize: 18.w,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mainText,
                            )
                          : AppTypography.mediumStyle.copyWith(
                              fontSize: 18.w,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainText,
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  bool countRows({required BuildContext context}) {
    final span = TextSpan(
      text: hurdle.hurdle_name,
      style: AppTypography.mediumStyle.copyWith(
        fontSize: 18.w,
        fontWeight: FontWeight.w500,
        color: AppColors.mainText,
      ),
    );
    final tp =
        TextPainter(text: span, maxLines: 3, textDirection: TextDirection.ltr);
    tp.layout(
        maxWidth: MediaQuery.of(context)
            .size
            .width); // equals the parent screen width
    return tp.didExceedMaxLines;
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final bool? isBold;
  final bool needToExpand;

  const ExpandableText({
    super.key,
    required this.text,
    this.isBold,
    required this.needToExpand,
  });

  @override
  State<StatefulWidget> createState() => _ExpState();
}

class _ExpState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            widget.text,
            overflow: TextOverflow.fade,
            maxLines: isExpanded ? null : 3,
            style: widget.isBold == true
                ? AppTypography.mediumStyle.copyWith(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainText,
                    overflow: TextOverflow.fade,
                  )
                : AppTypography.regularStyle.copyWith(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainText,
                    overflow: TextOverflow.fade,
                  ),
          ),
          if (widget.needToExpand)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: InkWell(
                onTap: () => setState(() {
                  isExpanded = !isExpanded;
                }),
                child: Row(
                  children: [
                    Text(
                      isExpanded ? 'Скрыть' : 'Еще',
                      style: AppTypography.regularStyle.copyWith(
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainText,
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      );
}
