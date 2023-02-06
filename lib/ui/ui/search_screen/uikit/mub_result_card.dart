import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/ui/ui/hurdle/ui/hurdle_screen.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Карточка в поиске, отображающая МУБ(Место установки барьера)
class MubResult extends StatelessWidget {
  final String mub;
  final Hurdle hurdle;
  final String query;

  const MubResult({
    Key? key,
    required this.query,
    required this.mub,
    required this.hurdle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => mub.contains(query) == true
      ? InkWell(
          onTap: () {
            context.read<SearchCubit>().disableSearch();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HurdleScreen(
                  hurdle: hurdle,
                  mubInitiallyExpanded: true,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'МУБ',
                  style: AppTypography.regularStyle.copyWith(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w400,
                    color: AppColors.paleBlue,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: mub.split(query).first,
                      style: AppTypography.regularStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainText,
                        fontSize: 16.w,
                      ),
                      children: [
                        TextSpan(
                            text: mub.contains(query) ? query : '',
                            style: AppTypography.regularStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainText,
                              fontSize: 16.w,
                            ),
                            children: [
                              TextSpan(
                                text: mub.split(query).last,
                                style: AppTypography.regularStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.mainText,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16.w,
                                ),
                              )
                            ]),
                      ]),
                )
              ],
            ),
          ),
        )
      : InkWell(
          onTap: () {
            context.read<SearchCubit>().disableSearch();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HurdleScreen(
                  hurdle: hurdle,
                  mubInitiallyExpanded: true,
                ),
              ),
            );
          },
          child: Text(
            mub,
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.regularStyle.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.mainText,
              fontSize: 16.w,
            ),
          ));
}
