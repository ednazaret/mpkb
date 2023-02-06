import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/passports/uikit/passports_body.dart';
import 'package:satefy_cage/ui/ui/search_screen/ui/search_screen.dart';
import 'package:satefy_cage/ui/uikit/back_button.dart';
import 'package:satefy_cage/ui/uikit/search_textfield.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class PassportsScreen extends StatefulWidget {
  const PassportsScreen(
      {Key? key, required this.onHome, required this.onTapSearch})
      : super(key: key);
  final VoidCallback onHome;
  final Function onTapSearch;

  @override
  State<StatefulWidget> createState() => _PassportsState();
}

class _PassportsState extends State<PassportsScreen> {
  TextEditingController controller = TextEditingController();

  get onHome => widget.onHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (_, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RawBackButton(onTap: onHome),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SearchTextField(
                            onTap: () => widget.onTapSearch(),
                            controller: controller,
                            query: context.read<SearchCubit>().state.query,
                            onChange: context.read<SearchCubit>().onTextChanged,
                            onClear: context.read<SearchCubit>().clearQuery,
                            onEdited: context.read<SearchCubit>().disableSearch,
                          ),
                        ),
                        // SearchTextField(),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Паспорта',
                      style: AppTypography.boldStyle.copyWith(
                        fontSize: 24.w,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              context.read<SearchCubit>().checkSearch()
                  ? SearchScreen(
                      query: context.read<SearchCubit>().state.query,
                    )
                  : PassportsBody(
                      onTapSearch: () => widget.onTapSearch(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
