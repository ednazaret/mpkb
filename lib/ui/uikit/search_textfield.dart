import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onEdited;
  final VoidCallback? onClear;
  final String? query;
  final void Function(String)? onChange;
  final TextEditingController? controller;

  const SearchTextField({
    Key? key,
    this.onTap,
    this.controller,
    this.onEdited,
    this.onChange,
    this.onClear,
    this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.w,
      child: TextField(
        // readOnly: true,
        onTap: onTap,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (onChange != null) onChange!(value);
          value = controller?.text ?? '';
        },
        onEditingComplete: onEdited,
        autocorrect: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              4.r,
            ),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          filled: true,
          fillColor: AppColors.lightGray,
          suffixIcon: context.read<SearchCubit>().state.searchEnabled == true
              ? IconButton(
                  onPressed: () {
                    controller?.clear();
                    if (onClear != null) onClear!();
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.mainBlue,
                    size: 24.w,
                  ),
                )
              : null,
          hintText: 'Поиск',
          alignLabelWithHint: true,
          hintMaxLines: 1,
          hintStyle: AppTypography.regularStyle.copyWith(
            fontSize: 16.w,
            fontWeight: FontWeight.w400,
            color: AppColors.paleBlue,
          ),
          prefixIcon:
              context.read<SearchCubit>().state.searchEnabled == false ||
                      context.read<SearchCubit>().state.searchEnabled == null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                      ),
                      child: Assets.images.search.svg(
                        width: 24.w,
                      ),
                    )
                  : null,
        ),
        style: AppTypography.regularStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16.w,
          color: AppColors.mainText,
        ),
        cursorColor: AppColors.mainText,
      ),
    );
  }
}
