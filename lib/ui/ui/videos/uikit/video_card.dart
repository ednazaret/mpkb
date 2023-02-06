import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final String passName;
  final List<Hurdle> hurdles;

  const VideoCard({Key? key, required this.hurdles, required this.passName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.paleBlueLight,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 17,
          ),
          child: Text(
            passName,
            style: AppTypography.regularStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18.w,
              color: AppColors.mainText,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            for (final hurdle in hurdles)
              InkWell(
                onTap: () async {
                  try {
                    context.read<SearchCubit>().clearQuery();
                    await launchUrl(Uri.parse(hurdle.video!));
                  } on Exception catch (_) {
                    // print('Error internet');
                  }
                },
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 22,
                            right: 14,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(12.r),
                                child: SizedBox.fromSize(
                                  size: Size(110.w, 100.w),
                                  child: Image.asset(
                                    'assets/media/screenshots/${hurdle.screen}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white.withOpacity(0.2),
                                ),
                                child: Assets.images.playOutlined.svg(
                                  width: 30.w,
                                  height: 30.h,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 12.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.images.barriermini.path,
                                    width: 22.w,
                                    height: 18.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: hurdle.hurdle_id
                                                    ?.toLowerCase()
                                                    .contains(context
                                                            .read<SearchCubit>()
                                                            .state
                                                            .query
                                                            ?.toLowerCase() ??
                                                        '') ==
                                                true &&
                                            context
                                                    .read<SearchCubit>()
                                                    .state
                                                    .query
                                                    ?.isNotEmpty ==
                                                true
                                        ? RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              text: hurdle.hurdle_id!
                                                  .toLowerCase()
                                                  .split(context
                                                          .read<SearchCubit>()
                                                          .state
                                                          .query
                                                          ?.toLowerCase() ??
                                                      '')
                                                  .first
                                                  .toUpperCase(),
                                              style: AppTypography.regularStyle
                                                  .copyWith(
                                                fontSize: 14.w,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.paleBlue,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: hurdle.hurdle_id
                                                                ?.toLowerCase()
                                                                .contains(context
                                                                        .read<
                                                                            SearchCubit>()
                                                                        .state
                                                                        .query
                                                                        ?.toLowerCase() ??
                                                                    '') ==
                                                            true
                                                        ? context
                                                            .read<SearchCubit>()
                                                            .state
                                                            .query
                                                            ?.toUpperCase()
                                                        : '',
                                                    style: AppTypography
                                                        .regularStyle
                                                        .copyWith(
                                                      fontSize: 14.w,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.mainBlue,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: hurdle.hurdle_id!
                                                            .toLowerCase()
                                                            .split(context
                                                                    .read<
                                                                        SearchCubit>()
                                                                    .state
                                                                    .query
                                                                    ?.toLowerCase() ??
                                                                '')
                                                            .last
                                                            .toUpperCase(),
                                                        style: AppTypography
                                                            .regularStyle
                                                            .copyWith(
                                                          fontSize: 14.w,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .paleBlue,
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          )
                                        : Text(
                                            hurdle.hurdle_id ?? '',
                                            style: AppTypography.regularStyle
                                                .copyWith(
                                              fontSize: 14.w,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.paleBlue,
                                            ),
                                          ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              SizedBox(
                                width: 203.w,
                                child: hurdle.hurdle_name?.contains(context
                                                    .read<SearchCubit>()
                                                    .state
                                                    .query ??
                                                '') ==
                                            true &&
                                        context
                                                .read<SearchCubit>()
                                                .state
                                                .query
                                                ?.isNotEmpty ==
                                            true
                                    ? RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          text: hurdle.hurdle_name!
                                                      .split(context
                                                              .read<
                                                                  SearchCubit>()
                                                              .state
                                                              .query ??
                                                          '')
                                                      .first
                                                      .contains(context
                                                              .read<
                                                                  SearchCubit>()
                                                              .state
                                                              .query ??
                                                          '') ==
                                                  false
                                              ? hurdle.hurdle_name!
                                                  .split(context
                                                          .read<SearchCubit>()
                                                          .state
                                                          .query ??
                                                      '')
                                                  .first
                                              : '',
                                          style: AppTypography.regularStyle
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.mainText,
                                            fontSize: 16.w,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: hurdle.hurdle_name
                                                            ?.contains(context
                                                                    .read<
                                                                        SearchCubit>()
                                                                    .state
                                                                    .query ??
                                                                '') ==
                                                        true
                                                    ? context
                                                        .read<SearchCubit>()
                                                        .state
                                                        .query
                                                    : '',
                                                style: AppTypography
                                                    .regularStyle
                                                    .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.mainText,
                                                  fontSize: 16.w,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: hurdle.hurdle_name!
                                                                .split(context
                                                                        .read<
                                                                            SearchCubit>()
                                                                        .state
                                                                        .query ??
                                                                    '')
                                                                .last
                                                                .contains(context
                                                                        .read<
                                                                            SearchCubit>()
                                                                        .state
                                                                        .query ??
                                                                    '') ==
                                                            false
                                                        ? hurdle.hurdle_name!
                                                            .split(context
                                                                    .read<
                                                                        SearchCubit>()
                                                                    .state
                                                                    .query ??
                                                                '')
                                                            .last
                                                        : '',
                                                    style: AppTypography
                                                        .regularStyle
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.mainText,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 16.w,
                                                    ),
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      )
                                    : Text(
                                        hurdle.hurdle_name ?? '',
                                        maxLines: 3,
                                        style:
                                            AppTypography.regularStyle.copyWith(
                                          fontSize: 14.w,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.mainText,
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }
}
