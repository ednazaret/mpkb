import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/ui/ui/favorite/bloc/favorites_cubit.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/passport/uikit/passport_body.dart';
import 'package:satefy_cage/ui/ui/search_screen/ui/search_screen.dart';
import 'package:satefy_cage/ui/uikit/back_button.dart';
import 'package:satefy_cage/ui/uikit/search_textfield.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class PassportScreen extends StatefulWidget {
  final Passport passport;
  final VoidCallback onTapSearch;

  const PassportScreen(
      {Key? key, required this.passport, required this.onTapSearch})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PassportState();
}

class _PassportState extends State<PassportScreen> {
  TextEditingController controller = TextEditingController();

  Passport get passport => widget.passport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (ctxt, state) => SafeArea(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (_, statee) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 22,
                    bottom: 15,
                  ),
                  child: Row(
                    children: [
                      RawBackButton(
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<SearchCubit>()
                              .returningEnabled(newStatus: false);
                          context.read<SearchCubit>().disableSearch();
                        },
                      ),
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
                    ],
                  ),
                ),
                context.read<SearchCubit>().checkSearch()
                    ? SearchScreen(
                        query: context.read<SearchCubit>().state.query,
                      )
                    : PassportBody(
                        passport: passport,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
