import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/ui/ui/hurdle/ui/hurdle_screen.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Карточка в поиске, отображающая барьер
class HurdleResult extends StatelessWidget {
  final Hurdle hurdle;
  final String query;

  const HurdleResult({Key? key, required this.hurdle, required this.query})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SearchCubit>().disableSearch();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HurdleScreen(
              hurdle: hurdle,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: hurdle.hurdle_name!.split(query).first,
                style: AppTypography.regularStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainText,
                  fontSize: 16.w,
                ),
                children: [
                  TextSpan(
                      text: hurdle.hurdle_name?.contains(query) == true
                          ? query
                          : '',
                      style: AppTypography.regularStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainText,
                        fontSize: 16.w,
                      ),
                      children: [
                        TextSpan(
                          text: hurdle.hurdle_name!.split(query).last,
                          style: AppTypography.regularStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.mainText,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16.w,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
