import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/passport/ui/passport_screen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class PassportWidget extends StatelessWidget {
  final Passport passport;
  final VoidCallback onTapSearch;

  const PassportWidget(
      {Key? key, required this.passport, required this.onTapSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SearchCubit>().returningEnabled(newStatus: true);
        Navigator.push(
            context,
            PageTransition<Widget>(
              child: PassportScreen(
                passport: passport,
                onTapSearch: onTapSearch,
              ),
              type: PageTransitionType.rightToLeft,
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 17,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                passport.passport_name ?? '',
                style: AppTypography.regularStyle.copyWith(
                  fontSize: 18.w,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainText,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.paleBlue,
              size: 23.w,
            )
          ],
        ),
      ),
    );
  }
}
